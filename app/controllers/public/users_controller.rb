class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :edit, :update]
  before_action :set_user, only: [:index, :show]

  def index
    @users = User.where(is_active: 'false')
  end

  def mypage
    @tags = @user.tags.find_by(id: @tag_id)
    redirect_to "/#{current_user.name}"
  end

  def show
    @training_records = Record.where(params[:training_record])
    @posts = @user.posts.find_by(id: @post_id)
    @all_records = Record.includes(:user)
    @user = User.find_by(name: params[:username])
    @records = @user.records.where(name: params[:username])
  end

  def edit
    @user = current_user
    unless @user == current_user
      redirect_to "/#{@user.name}"
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to "/#{current_user.name}"
    else
      redirect_to "/#{current_user.name}/edit"
    end
  end

  def following
    @title = "Following"
    @user = User.find_by(name: params[:username])
    @users = @user.followings
    render 'show_following'
  end

  def follower
    @title = "Followers"
    @user = User.find_by(name: params[:username])
    @users = @user.followers
    render 'show_follower'
  end

  def unsubscribe
    @user = current_user
  end

  def widthdraw
    @user = current_user
    @user.update(is_active: true)
    reset_session
    redirect_to root_path
  end

  def search
    @users = User.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  private

  def set_user
    @users = User.where(is_active: 'false')
    @user = User.find_by(name: params[:username])
  end

  def user_params
    values = params.require(:user).permit(:name, :profile_image, :introduction, tag_ids: [])
    if values[:tag_ids].nil?
      values[:tag_ids] = []
    end
    return values
  end
end
