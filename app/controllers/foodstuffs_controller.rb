class FoodstuffsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foodstuff = Foodstuff.new
    @foodstuffs = @recipe.foodstuffs.order(created_at: :desc)
  end


  def create
    @foodstuff = Foodstuff.new(foodstuff_params)
    @foodstuffs = Foodstuff.all
    if @foodstuff.save
    @foodstuff = Foodstuff.new
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