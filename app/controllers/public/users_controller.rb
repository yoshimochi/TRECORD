class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def mypage
    redirect_to "/#{current_user.name}"
  end

  def show
  end

  

  private

  def set_user
    @user = User.find_by(name: params[:username])
  end

end
