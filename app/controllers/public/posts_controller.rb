class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end
  
  def index
    @posts = Post.page(params[:page]).per(20)
  end

  private
  def post_params
    params.require(:post).permit(:body, :image)
  end
end
