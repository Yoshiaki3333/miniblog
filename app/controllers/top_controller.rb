class TopController < ApplicationController
  def index
    @tweets = Tweet.includes(:user).order('created_at DESC').page(params[:page]).per(5)
  end
end