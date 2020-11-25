class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :new]
  def index
    @tweets = Tweet.includes(:user).order('created_at DESC').page(params[:page]).per(5)
  end
  
  def new
  end
  
  def create
    Tweet.create(text: tweet_params[:text], user_id: current_user.id) 
    redirect_to root_path
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if current_user.id == tweet.user_id || current_user.nickname=="よしあき"
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params) if tweet.user_id == current_user.id || current_user.nickname=="よしあき"
  end
  
  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end
  
  private
  def tweet_params
    params.permit(:text)
  end
  
  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
  
end