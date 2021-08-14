class Public::HomesController < ApplicationController
  def top
    if user_signed_in?
      @all_records = Record.includes(:user)
      @user = User.find(current_user.id)
      @records = Record.where(user_id: current_user.id)
    else

    end
  end

  def about
  end
end
