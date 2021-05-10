class ResourcesController < ApplicationController

  def index
    # newsapi = News.new("8c3126bd276b47308f36ad5a2dbb2067")
    # to_date = Date.today.strftime("%Y-%m-%d")
    # from_date = Date.yesterday.strftime("%Y-%m-%d")
    # sources = newsapi.get_sources(country: 'in', language: 'en')
    # @news = newsapi.get_everything(q: 'corona OR coronavirus OR vaccine OR vaccination',sources: 'the-hindu,the-times-of-india',domains: 'bbc.co.uk,techcrunch.com',from: from_date, to: to_date,language: 'en',sortBy: 'recent').take(20)
  end
  
  def create
    resource = Resource.new(resource_params)
  end

  def search
    @tweets = []
    city = params[:city]
    resource = Resource.find(params[:resource_id]).name
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
