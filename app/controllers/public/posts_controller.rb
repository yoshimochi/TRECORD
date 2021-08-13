class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.order(created_at: "DESC").includes(:user).page(params[:page]).without_count.per(4)
  end

  def show
    @post = Post.includes(post_comments: :user).find(params[:id])
    # @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = PostComment.all
    # @post_comments = @post.post_comments.includes(:user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(update_post_params)
    redirect_to post_path(@post)
  end

  private
  def post_params
    params.require(:post).permit(:body, :image)
  end

  def update_post_params
    params.require(:post).permit(:body, :image)
  end

end
