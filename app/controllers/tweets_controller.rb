class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order("created_at DESC").page(params[:page]).per_page(5)

  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save

  redirect_to root_path
end

  def destroy
    @tweet= Tweet.find_by(id: params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
