class Public::HomesController < ApplicationController
  def top
    @user = current_user
    @records = Record.where(user_id: current_user).order(start_time: "desc").page(params[:page]).per(8)
  end

  def about
  end

end
