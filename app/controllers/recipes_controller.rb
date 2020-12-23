class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    
    @recipe = Recipe.new(recipe_params)
    @recipe.valid?
    if @recipe.save
      @recipe[:id]
      redirect_to new_recipe_foodstuff_path(@recipe.id)
    else
      render :new
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :process, :details, :main_image, tag_ids: []).merge(user_id: current_user.id)
  end

end

