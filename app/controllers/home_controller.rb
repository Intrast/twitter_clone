class HomeController < ApplicationController
  def index
    @tweet = Tweet.new
    @tweets = current_user.tweets
    @users = User.all
  end
end
