module Remetric
  class Trackable
    include Mongoid::Document

    field :model
    field :key
    field :data, type: Hash
    
    index({ key: 1 }, { unique: true, name: "trackable_key_index" })
    
    validates_presence_of :model
    validates_presence_of :key
    validates_uniqueness_of :key, scope: :model
  end
end
