class VaccinesController < ApplicationController
  require 'rest-client'

  def index

  end

  def state
    byebug
    url = "https://cdn-api.co-vin.in/api/v2/admin/location/states"
    @states = RestClient.get(url)
  end

end