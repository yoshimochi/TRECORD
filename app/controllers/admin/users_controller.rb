class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tags = @user.tags.find_by(id: @tag_id)
  end

  def edit
    @user = User.find(params[:id])
    @tags = @user.tags.find_by(id: @tag_id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_users_path
  end

  def following
    @user = User.find(params[:user_id])
    @users = user.followings
  end

  def follower
    @user = User.find(params[:user_id])
    @users = user.followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :is_active)
  end
end
