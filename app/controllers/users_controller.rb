class UsersController < ApplicationController

  def edit
  end

  def update
    if @user.update(tweet_params)
      render "messages/index"
    else
      render :edit
    end
  end
  private
  def tweet_params
     params.permit(:name, :email)
  end

  def initialize
    @user = User.find(params[:id])
  end
end
