class TweetsController < ApplicationController
  before_action :load_cities
  before_action :load_resources

  def dashboard 
    
  end

  def search
    city = params[:city]
    resource = params[:resource]
    tweets = Twitter::REST::Client.new do |config|
      config.consumer_key =  ENV['TWITTER_API_KEY']
      config.consumer_secret = ENV['TWITTER_API_SECRET']
      config.access_token = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
    @tweets = tweets.search("#{city} AND #{resource} ", result_type: "recent", tweet_mode: "extended").take(10)
  end

  private

  def load_params
    city = params[:city]
    resource = params[:resource]
  end

  def load_cities
    @cities = City.all
  end
  def load_resources
    @resources = Resource.all
  end

  def tweet_params
    params.require(:tweet).permit(:city, :resource)
  end
end
