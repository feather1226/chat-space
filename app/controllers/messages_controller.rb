class MessagesController < ApplicationController
  before_action :get_group_message , only: [:index, :create]

  def index
  end
  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path , notice: 'メッセージを作成しました。'
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
      @messages = @group.messages
      @message  = Message.new
  end
end
