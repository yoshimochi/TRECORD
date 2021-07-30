class Admin::HomesController < ApplicationController
  def top
    path = Rails.application.routes.recognize_path(request.referer)

    if path[:controller] == "admin/users" && path[:action] == "show"
      @posts = Post.where(user_id: path[:id]).page(params[:page]).per(10).order("created_at DESC")
    else
      @posts = Post.page(params[:page]).per(10).order("created_at DESC")
    end
  end
end
