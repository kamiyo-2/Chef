class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.valid?
    if @recipe.save
      redirect_to recipe_detail_recipe_path(@recipe.id)
    else
      redirect_to new_recipe_path(@recipe.id)
    end
  end

  def recipe_detail
    @recipe = Recipe.find(params[:id])
    @foodstuff = Foodstuff.new
    @foodstuffs = @recipe.foodstuffs
    @recipephoto = Recipephoto.new
    @recipephotos = @recipe.recipephotos.order(created_at: :desc)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foodstuff = Foodstuff.new
    @foodstuffs = @recipe.foodstuffs
    @recipephoto = Recipephoto.new
    @recipephotos = @recipe.recipephotos.order(created_at: :desc)
  end


  private
  def recipe_params
    params.require(:recipe).permit(:title, :process, :details, :main_image, tag_ids: []).merge(user_id: current_user.id)
  end
 
end

