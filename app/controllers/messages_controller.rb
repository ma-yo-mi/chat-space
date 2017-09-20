class MessagesController < ApplicationController
  before_action :set_group

def index
    @message = Message.new
  end

  def create

    @message = current_user.messages.new(message_params)
    if @message.save
     flash[:notice] = "メッセージを作成しました"
    redirect_to group_messages_path
    else
      flash[:alert] ="メッセージを保存できませんでした"
      render action: :index
    end
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end
end
