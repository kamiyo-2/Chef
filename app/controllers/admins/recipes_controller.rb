class Admins::RecipesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foodstuff = Foodstuff.new
    @foodstuffs = @recipe.foodstuffs
    @recipephoto = Recipephoto.new
    @recipephotos = @recipe.recipephotos.order(created_at: :desc)
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @foodstuff = Foodstuff.new
    @foodstuffs = @recipe.foodstuffs
    @recipephoto = Recipephoto.new
    @recipephotos = @recipe.recipephotos.order(created_at: :desc)
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to admins_recipe_path(@recipe)
    else
      render :edit
    end
  end

  def search
    @recipes = Recipe.search(params[:search])
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(:title, :process, :details, :main_image, tag_ids: [])
  end

end

