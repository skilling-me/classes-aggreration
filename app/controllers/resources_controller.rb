class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @resources_searched = Resource.search_by_user(params[:search]).order("created_at DESC")
      unless @resources_searched.any?
        @resources = Resource.all
      end
      @search_phrase = params[:search]
    else
      @resources = Resource.all
    end

    if params[:tag]
      @resources = Resource.tagged_with(params[:tag])
    end

    @categories = Category.all
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      redirect_to @resource, notice: 'Resource was successfully created.'
    else
      render :new
    end
  end

  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: 'Resource was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @resource.destroy
    redirect_to resources_url, notice: 'Resource was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(:title, :description, :url, :tag_list, :cost_list, :level_list, :type_list)
    end
end
