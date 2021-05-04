class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def create
    city = City.new(city_params)
  end

  def search
    name = params[:name]
    city = City.where('name iLike ?', name)
  end

  private

  def city_params 
    params.require(:city).permit(:name)
  end

end
