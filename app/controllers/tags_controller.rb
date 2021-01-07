class TagsController < ApplicationController
  def index
  end

  def show
    @tag = Tag.find(params[:id])
    @recipe = Recipe.new
    @recipes = @tag.recipes
  end
end