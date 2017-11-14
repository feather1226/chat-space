class GroupsController < ApplicationController
before_action :get_id, only: [:edit, :update]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました。'
    else
      render :new, alert: 'グループの作成に失敗しました。'
    end
  end

  def update
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループ名を更新しました。'
    else
      render :edit, alert: 'グループ名の更新に失敗しました。'
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

  def get_id
    @group = Group.find(params[:id])
  end
end
