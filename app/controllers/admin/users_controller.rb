class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all.order(created_at: :asc).page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @tags = @user.tags.find_by(id: @tag_id)
    @posts = Post.where(user_id: @user.id)
    @all_records = Record.includes(:user)
    # @user = User.find_by(id: @user_id)
    @records = Record.where(user_id: @user.id)
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
    @title = "Following"
    @user = User.find(params[:user_id])
    @users = @user.followings
    render 'show_following'
  end

  def follower
    @title = "Followers"
    @user = User.find(params[:user_id])
    @users = @user.followers
    render 'show_follower'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :is_active)
  end
end
