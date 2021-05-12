class VaccinesController < ApplicationController
  require 'rest-client'
  
  def index

  end

  def state
    url = "https://cdn-api.co-vin.in/api/v2/admin/location/states"
    response = RestClient::Request.new(
      :method=> :get,
      :url=> url,
      :headers=>{:user_agent=> ENV["USER_AGENT"], :Authorization=> ENV["BEARER"]}
      ).execute
    states = ActiveSupport::JSON.decode(response.body)
    state = states.select{|key, hash| key == "states" }
    @all_states = []
    state.each do |key, value|
      value.each do |value| 
        @all_states.append(value)
      end
    end 
    
  end

  def district
    url = "https://cdn-api.co-vin.in/api/v2/admin/location/districts/#{params["state_id"]}"
    response = RestClient::Request.new(
      :method=> :get,
      :url=> url,
      :headers=>{:user_agent=> ENV["USER_AGENT"], :Authorization=> ENV["BEARER"]}
      ).execute  
    districts = ActiveSupport::JSON.decode(response.body)
    district = districts.select{|key, hash| key == "districts" }
    @all_districts = []
    district.each do |key, value|
      value.each do |value| 
        @all_districts.append(value)
      end
    end 
    @all_districts
  end

  def find_by_district
    date = Date.today.strftime("%d-%m-%Y")
    url = "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByDistrict?district_id=#{params["district_id"]}&date=#{date}"
    response = RestClient::Request.new(
      :method=> :get,
      :url=> url,
      :headers=>{:user_agent=> ENV["USER_AGENT"], :Authorization=> ENV["BEARER"]}
      ).execute  
    centers = ActiveSupport::JSON.decode(response.body)
    @center = centers.first[1]
  end
end