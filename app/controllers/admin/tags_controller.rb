class Admin::TagsController < ApplicationController

  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to admin_tags_path
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(update_tag_params)
    redirect_to admin_tags_path
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end

  def update_tag_params
    params.require(:tag).permit(:name)
  end
end
