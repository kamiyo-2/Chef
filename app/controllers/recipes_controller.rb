class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    
    @recipe = Recipe.new(recipe_params)
    @recipe.valid?
    if @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      redirect_to recipe_path(@recipephoto.recipe)
    end
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
  # def recipe_params
    
  #   params.require(:recipe).permit(:title, :process, :details, :main_image, tag_ids: [], foodstuffs_attributes: [:material, :quantity]).merge(user_id: current_user.id)
  # end

end

