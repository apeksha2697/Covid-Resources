class TweetsController < ApplicationController

  def dashboard 
  end

  def search
    byebug
    city = params[:city]
    resource = params[:resource]
    tweet = Tweet.where('city iLIKE ? AND resource iLIKE ?', city, resource)
  end

  def tweet_params
    params.require(:tweet).permit(:city, :resource)
  end
end
