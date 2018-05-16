class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
   @tweet = Tweet.new(tweet_params)
    if @tweet.save
     redirect_to root_path
    else
     render :new
    end
  end

  def destroy
    @tweet= Tweet.find_by(id: params[:id])
    @tweet.destroy
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end