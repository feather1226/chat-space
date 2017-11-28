class MessagesController < ApplicationController
  before_action :get_group_message , only: [:index, :create]

  def index
    @new_message
      respond_to do |format|
      format.html
      format.json { @new_message = Message.where('id > ?', params[:message][:id].to_i) }
    end
  end
  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
      format.html { redirect_to group_messages_path(params[:group_id])}
      format.json
    end
    else
      flash.now[:alert] =  'メッセージ送信に失敗しました。'
      render :index
    end
  end

  private
    def message_params
        params.require(:message).permit(:image, :body).merge(group_id: @group.id)
    end
    def get_group_message
      @group = Group.find(params[:group_id])
      @groups = current_user.groups
      @messages = @group.messages.order(created_at: :ASC).includes(:user)
      @message = Message.new
  end
end
