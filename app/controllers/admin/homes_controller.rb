class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @posts = Post.order(created_at: "DESC").includes(:user).page(params[:page]).without_count.per(2)
  end
end
