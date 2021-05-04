class ResourcesController < ApplicationController

  def index
    Resource.all
  end

  def create
    resource = Resource.new(resource_params)
  end

  private

  def resource_params 
    params.require(:resource).permit(:name)
  end

end
