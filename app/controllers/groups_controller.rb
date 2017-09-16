class GroupsController < ApplicationController
  def index
    @group = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
       flash[:notice] = "グループを作成しました"
      redirect_to root_path
    else
      render action: :new
    end
# TODO: 作動するかview作成したら確認要(controller & model)
  end

  def edit
    find_group_id
  end

  def update
    find_group_id
    if @group.update(group_params)
      flash[:notice] = "グループを編集しました"
      redirect_to root_path
    else
      render action: :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name)
# TODO: 作動するかview作成したら確認要(controller & model)
  end

  def find_group_id
    @group = Group.find(params[:id])
  end
end
