class TagsController < ApplicationController
  def index
  end

  def show
    @tag = Tag.find(params[:id])
    @recipes = @tag.recipes
  end

end