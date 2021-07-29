class Admin::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @post_comments = PostComment.find_by(id: @post.id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(update_post_params)
    redirect_to admin_post_path(@post)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_root_path
  end

  private
  def update_post_params
    params.require(:post).permit(:body, :image)
  end
end
