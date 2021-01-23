class Admins::TagsController < ApplicationController
  before_action :authenticate_admin!
  def index
  @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.valid?
    if @tag.save
      redirect_to admins_tags_path
    else
      render :new
    end
  end

  def show
    @tag = Tag.new
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to admins_tags_path
    else
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to admins_tags_path
  end

  private
  def tag_params
    params.require(:tag).permit(:name, :tag_image)
  end
end