class HomeController < ApplicationController
  def index
    @tweet = Tweet.new
    @tweets = current_user.tweets
  end
end
