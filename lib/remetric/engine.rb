module Remetric
  class Engine < ::Rails::Engine
    isolate_namespace Remetric
  end
  
  def self.config(&block)
    @@config ||= Remetric::Engine::Configuration.new
    yield @@config if block
    return @@config
  end
  
  def self.track data = {}
    Event.create data
  end
end
