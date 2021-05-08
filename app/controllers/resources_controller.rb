class ResourcesController < ApplicationController

  def index
    @resources = Resource.all
  end

  def create
    resource = Resource.new(resource_params)
  end

  def search
    @tweets = []
    city = City.find(params[:city_id]).name
    resource = params[:resource]
    tweets = Twitter::REST::Client.new do |config|
      config.consumer_key =  ENV['TWITTER_API_KEY']
      config.consumer_secret = ENV['TWITTER_API_SECRET']
      config.access_token = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
    @search = tweets.search("(#{city} OR #{'#'+city})  (#{'#'+resource} OR #{'#'+resource+'s'} OR #{resource}) ('#verified' OR 'verified')",  result_type: "recent", tweet_mode: "extended").take(100)
    @search.each do |tweet|
      if tweet.created_at > DateTime.now.yesterday.utc
        @tweets.append(tweet)
      end
    end
    @tweets
  end

  private

  def resource_params 
    params.require(:resource).permit(:name)
  end

end
