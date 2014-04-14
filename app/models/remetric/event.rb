module Remetric
  class Event
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Attributes::Dynamic

    field :description
    
    validates_presence_of :description
    
    before_create :attach_trackable_models
    
    def story
      Liquid::Template.parse(description).render(attributes)
    end
    
    def linked_story
      d = attributes
      
      Remetric.config.trackable_models.each do |model, cols|
        model = model.to_s

        if self.has_attribute? model
          key = d[model]["id"]
          
          # if Trackable.where(model: model, key: key.to_s).first
            linked_model_attributes = {}
            self.send(model).map { |k, v| linked_model_attributes[k] = "<a href=\"#{Engine.routes.url_helpers.trackable_path(model.pluralize, key)}\">#{v}</a>" }
            d.delete model
            d[model] = linked_model_attributes
          # end
        end
      end
      
      Liquid::Template.parse(description).render(d)
    end
    
    def attach_trackable_models
      Remetric.config.trackable_models.each do |model, cols|
        model = model.to_s
        
        if self.has_attribute? model
          args = self.send(model)
          args = args.attributes if args.class.ancestors.include? ActiveRecord::Base
          args = args.with_indifferent_access
          key_field = cols[:key]
          key_field = :id if key_field.blank?
          key = args[key_field].to_s.parameterize
          t = Trackable.where(key: key, model: model).first_or_initialize
          t.data ||= {}
          t.data = t.data.merge(args)
          
          if t.save
            self[model] = t.data
          end
        end
      end
    end
  end
end
