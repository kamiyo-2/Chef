class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @recipe.foodstuffs.build

  end

  def create
    
    @recipe = Recipe.new(recipe_params)
    @recipe.valid?
    if @recipe.save

      redirect_to root_path
    else
      render :new
    end
  end


  def show
    @recipe = Recipe.find(params[:id])
    @recipephoto = Recipephoto.new
    @recipephots = @recipe.recipephotos
    @foodstuff = Foodstuff.new
    @foodstuffs = @recipe.foodstuffs
  end


  private
  def recipe_params
    
    params.require(:recipe).permit(:title, :process, :details, :main_image, tag_ids: [], foodstuffs_attributes: [:material, :quantity]).merge(user_id: current_user.id)
  end

end

