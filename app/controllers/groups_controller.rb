class GroupsController < ApplicationController
  def new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to_group_path
    else
      render action: :new
    end
# TODO: 作動するかview作成したら確認要(controller & model)
  end

  def edit
  end

  private
  def group_params
    params.permit(:name)
# TODO: 作動するかview作成したら確認要(controller & model)
  end
end
