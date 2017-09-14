class MessagesController < ApplicationController
before_action :move_to_index, except: :index

  def index
  end

  def new
  end

  def create
    @member = Member.new(member_params)
  if @member.save
    flash[:notice] = "メッセージ送信成功"
    redirect_to members_path
  else
    flash.now[:alert] = 'メッセージの送信失敗'
    render action: :index
  end
  end



private

  def member_params
    params.require(:message).permit(:image)
  end
end
