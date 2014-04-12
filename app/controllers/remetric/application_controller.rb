module Remetric
  class ApplicationController < ActionController::Base
    before_filter :set_trackable_models
    
    def set_trackable_models
      @trackable_models ||= Remetric.config.trackable_models.map { |k, v| k.to_s }
    end
  end
end
