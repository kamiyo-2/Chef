class Admins::RecipesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_recipe,  only: [:show, :edit, :update]
  before_action :set_recipe_children,  only: [:show, :edit]
  def index
    @recipes = Recipe.all
  end

  def show
    @comments = @recipe.comments
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to admins_recipe_path(@recipe)
    else
      render :edit
    end
  end

  def search
    @recipes = Recipe.search(params[:search]).order("created_at DESC")
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(:title, :process, :details, :main_image, tag_ids: [])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_recipe_children
    @foodstuff = Foodstuff.new
    @foodstuffs = @recipe.foodstuffs
    @recipephoto = Recipephoto.new
    @recipephotos = @recipe.recipephotos
  end
end

