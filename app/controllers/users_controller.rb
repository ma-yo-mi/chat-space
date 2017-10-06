class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end


  def index
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%")
     respond_to do |format|
       format.html
       format.json
      end
  end


  def new
    @user = User.new
  end


  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
