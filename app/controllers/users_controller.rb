class UsersController < ApplicationController

  def edit
  end

  def update
    if @user.update(users_params)
      render "messages/index"
    else
      render :edit
    end
  end
  private
  def users_params
     params.permit(:name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
