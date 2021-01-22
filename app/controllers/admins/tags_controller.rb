class Admins::TagsController < ApplicationController
  efore_action :authenticate_admin!
  def index
  tags = Tag.all
  end
  def show
    @tag = Tag.find(params[:id])
    @recipes = @tag.recipes
  end

end