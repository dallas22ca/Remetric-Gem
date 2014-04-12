require_dependency "remetric/application_controller"

module Remetric
  class EventsController < ApplicationController
    before_action :set_event, only: [:show]

    # GET /events
    def index
      @events = Event.all
      @events = Event.where(description: params[:description]) if params[:description]
      @descriptions = @events.group_by(&:description).sort_by{|k, v| v.count}.reverse.to_a
    end

    # POST /events
    def create
      @event = Event.new(event_params)

      if @event.save
        redirect_to @event, notice: 'Event was successfully created.'
      else
        render :new
      end
    end

    # DELETE /events/1
    def destroy
      @events = Event.delete_all if params[:confirm]
      redirect_to :back, notice: 'Event was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_event
        @event = Event.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def event_params
        params[:event]
      end
  end
end
