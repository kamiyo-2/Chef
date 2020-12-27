class FoodstuffsController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foodstuff = Foodstuff.new
    @foodstuffs = @recipe.foodstuffs.order(created_at: :desc)
  end

  

  def create
    @foodstuff = Foodstuff.new(foodstuff_params)
  
    if @foodstuff.save
   
      redirect_to new_recipe_recipephoto_path( @foodstuff.recipe_id)
    else
      @recipe = @foodstuff.recipe
      @foodstuffs = @recipe.foodstuffs
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @foodstuffs = Foodstuff.where(recipe_id: @recipe.id)
    @foodstuff = Foodstuff.new
  end

  private
  def foodstuff_params
    params.require(:foodstuff).permit(:material, :quantity).merge(recipe_id: params[:recipe_id])
  end
  
end