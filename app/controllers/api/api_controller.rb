module Api
  class ApiController < ApplicationController
    #skip_before_action :verify_authenticity_token

    def index
      respond_to do |format|
        format.json do
          @collection = resource_class.all
          render json: @collection.as_json(as_json_collection)
        end
      end
    end

    def show
      respond_to do |format|
        format.json do
          @resourse = resource_class.find(params[:id])
          render json: @resourse.as_json(as_json_resource)
        end
      end
    end

    def create
      respond_to do |format|
        format.json do
          @resourse = resource_class.new(resource_params)
          if @resourse.save
            render json: @resourse.as_json(as_json_resource)
          else
            render json: {errors: @resourse.errors}, status: :unprocessable_entity
          end
        end
      end
    end

    def update
      respond_to do |format|
        format.json do
          @resource = resource_class.find(params[:id])
          @resource.assign_attributes(resource_params)
          if @resource.save
            render json: @resource.as_json(as_json_resource)
          else
            render json: {errors: @resource.errors}, status: :unprocessable_entity
          end
        end
      end
    end

    def destroy
      respond_to do |format|
        format.json do
          @resource = resource_class.find(params[:id])
          @resource.destroy
          render json: {success: true}
        end
      end
    end

    private

    def resource_class
      raise NotImplementedError
    end

    def resource_params
      raise NotImplementedError
    end

    def as_json_collection
      {}
    end

    def as_json_resource
      {}
    end

  end
end