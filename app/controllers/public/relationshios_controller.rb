class Public::RelationshiosController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @other_user = User.find(params[:follower])
    current_user.follow(@other_user)
    redirect_to request.referer
  end

  def destroy
    @user = current_user.relationships.find(params[:id]).follower
    current_user.unfollow(params[:id])
    redirect_to request.referer
  end

end
