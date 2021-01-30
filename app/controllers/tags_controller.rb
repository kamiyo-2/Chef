class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @recipes = @tag.recipes.order("created_at DESC")
  end
end