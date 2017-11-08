class UsersController < ApplicationController
  def edit
      @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
   if user.update(tweet_params)
   render "messages/index"
   else render :edit
   end
end
  private
  def tweet_params
     params.permit(:name, :email)
  end
end
