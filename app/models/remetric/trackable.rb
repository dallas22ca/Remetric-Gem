module Remetric
  class Trackable
    include Mongoid::Document
    include Mongoid::Timestamps

    field :model
    field :key
    field :data, type: Hash
    
    index({ key: 1 }, { unique: true, name: "trackable_key_index" })
    
    validates_presence_of :model
    validates_presence_of :key
    validates_uniqueness_of :key, scope: :model
    
    def events
      Event.where "#{model}.id" => key
    end
    
    def self.matchers
      [
        ["contains", "ilike"],
        ["is exactly", "="],
        ["is not", "!="],
        ["greater than", ">"],
        ["greater than or equal to", ">="],
        ["less than", "<"],
        ["less than or equal to", "<="],
        ["exists", "exists"],
        ["does not exist", "does not exist"]
      ]
    end
  end
end
