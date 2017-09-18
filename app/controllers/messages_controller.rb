class MessagesController < ApplicationController
  before_action :set_group, :set_group_users, :set_message
  def index
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

  def new
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_group_users
    @groups = current_user.groups
  end

  def set_message
    @message = current_user.messages.new
  end

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end
end
