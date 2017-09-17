class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
       flash[:notice] = "グループを作成しました"
      redirect_to root_path
    else
      flash[:alert] ="グループを作成できません"
      render action: :new
    end
# TODO: 作動するかview作成したら確認要(controller & model)
  end

  def edit
    search_group
  end

  def update
    search_group
    if @group.update(group_params)
      flash[:notice] = "グループを編集しました"
      redirect_to root_path
    else
      render action: :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def search_group
    @group = Group.find(params[:id])
  end
end
