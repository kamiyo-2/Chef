class Admins::FoodstuffsController < ApplicationController
  before_action :authenticate_admin!
  skip_before_action :verify_authenticity_token

  def create
    @recipe = Recipe.find params[:recipe_id]
    @foodstuff = Foodstuff.new(foodstuff_params)
    if @foodstuff.save
      render :create
    else
      render :errors
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @foodstuff = Foodstuff.new
    @foodstuffs = @recipe.foodstuffs
    @recipephoto = Recipephoto.new
    @recipephotos = @recipe.recipephotos
  end

  def destroy
    @foodstuff = Foodstuff.find(params[:id])
    if @foodstuff.destroy
      render :create
    end
  end

  private
  def foodstuff_params
    params.require(:foodstuff).permit(:material, :quantity).merge(recipe_id: params[:recipe_id])
  end
  
end