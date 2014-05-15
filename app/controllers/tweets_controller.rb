class TweetsController < ApplicationController
  before_action :get_tweet, only: [:edit, :update, :destroy]
  before_action :check_auth, only => [:edit, :update, :destroy]
  
  def get_tweet
    @tweet = Tweet.find(params[:id])
  end
  
  def check_auth
    if session[:zombie_id] != @tweet.zombie_id      
      redirect_to(tweets_path,
      notice: "Sorry, you can't edit this tweet")
    end
  end
  
  def index
    if params[:zipcode]
      @tweets = Tweet.where(zipcode: params[:zipcode])
    else
      @tweets = tweet.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml {render xml: @tweets}
  end
  
  def show
    @tweet = Tweet.find(params[:id])
    render action: 'status'
  end
  
  def edit; end

end
