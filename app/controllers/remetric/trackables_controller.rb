require_dependency "remetric/application_controller"

module Remetric
  class TrackablesController < ApplicationController
    before_filter :set_model
    before_action :set_trackable, only: [:show, :edit, :update]

    # GET /trackables
    def index
      @cols = Remetric.config.trackable_models[@model.to_sym].except(:key).map { |k, v| k.to_s }
      @trackables = Trackable
      @trackables = @trackables.where(model: @model)
      
      cookies["#{@model}_q"] = params[:q] if params[:q]
      @q = cookies["#{@model}_q"]
      
      unless @q.blank?
        q = Regexp.new @q, i: true
        any_ofs = []
        
        @cols.each do |col|
          if col == "id"
            any_ofs.push({ "key" => q })
          else
            any_ofs.push({ "data.#{col}" => q })
          end
        end
        
        @trackables = @trackables.any_of(any_ofs)
      end
    end

    # GET /trackables/1
    def show
    end

    # GET /trackables/new
    def new
      @trackable = Trackable.new
    end

    # GET /trackables/1/edit
    def edit
    end

    # POST /trackables
    def create
      @trackable = Trackable.new(trackable_params)

      if @trackable.save
        redirect_to @trackable, notice: 'Trackable was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /trackables/1
    def update
      if @trackable.update(trackable_params)
        redirect_to @trackable, notice: 'Trackable was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /trackables/1
    def destroy
      Trackable.where(model: @model).delete_all if params[:confirm]
      redirect_to :back, notice: "#{@model.pluralize.capitalize} were successfully destroyed."
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_trackable
        @trackable = Trackable.where(model: @model, key: params[:key]).first
      end

      # Only allow a trusted parameter "white list" through.
      def trackable_params
        params[:trackable]
      end
      
      def set_model
        @model = params[:collection].downcase.singularize
        
        if !@trackable_models.include? @model
          redirect_to root_path, notice: "#{params[:collection].capitalize} do not exist. To track them, update your Remetric config."
        end
      end
  end
end
