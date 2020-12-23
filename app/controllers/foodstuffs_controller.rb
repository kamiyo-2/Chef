class FoodstuffsController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foodstuff = Foodstuff.new
  end

  

  def create
    @foodstuff = Foodstuff.new(foodstuff_params)
  
    if @foodstuff.save
    redirect_to new_recipe_text_path( @foodstuff.recipe_id)
    else
      @recipe = @foodstuff.recipe
      @foodstuffs = @recipe.foodstuffs
      render :new
    end
  end

  private
  def foodstuff_params
    params.require(:foodstuff).permit(:material, :quantity).merge(recipe_id: params[:recipe_id])
  end
  
end
