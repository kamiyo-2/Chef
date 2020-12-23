class TagsController < ApplicationController
  def index
    @tags = Tag.find(1)
    @tagss = Tag.find(2)
    @tagsss = Tag.find(3)
    @tagssss = Tag.find(4)
    @tagsssss = Tag.find(5)
    @tagssssss = Tag.find(6)
    @tagsssssss = Tag.find(7)
    @tagssssssss = Tag.find(8)
    @tagsssssssss = Tag.find(9)
  end

  def show
    @tag = Tag.find(params[:id])
    @recipe = Recipe.new
    @recipes = @tag.recipes
  end
end