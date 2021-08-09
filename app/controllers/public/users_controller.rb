class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.where(is_active: 'false')
  end

  def mypage
    redirect_to "/#{current_user.name}"
  end

  def show
    @tags = @user.tags.find_by(id: @tag_id)
    @records = @user.records.find_by(id: @record_id)
    @training_records = Record.where(params[:training_record])
    @posts = @user.posts.find_by(id: @post_id)
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
    @users = @user.followings.all
    render 'show_follow'
  end

  def follower
    @title = "Followers"
    @user = User.find_by(name: params[:username])
    @users = @user.followers.all
    render 'show_follow'
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

  private

  def set_user
    @user = User.find_by(name: params[:username])
  end

  def user_params
    # values = params.fetch(:user, {}).permit(:name, :profile_image, :introduction, tag_ids: [])
    # if values[:tag_ids].nil?
    #   values[:tag_ids] = []
    # end
    # return values
    values = params.require(:user).permit(:name, :profile_image, :introduction, tag_ids: [])
    if values[:tag_ids].nil?
      values[:tag_ids] = []
    end
    return values
  end
end
