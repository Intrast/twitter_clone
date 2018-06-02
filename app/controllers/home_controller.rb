class HomeController < ApplicationController
  def index
    @tweet = Tweet.new
    # @tweets = Tweet.all.order("created_at DESC").page(params[:page]).per_page(5)
    # @users = User.all
    follower_ids = current_user.followings.pluck(:id)
    @tweets = Tweet.where(user_id: follower_ids).order("created_at DESC").page(params[:page]).per_page(5)
  end
end
