class Admins::FoodstuffsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_foodstuff, only: [:edit, :destroy]

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
    @foodstuff = Foodstuff.new
    @foodstuffs = @recipe.foodstuffs
    @recipephoto = Recipephoto.new
    @recipephotos = @recipe.recipephotos.order(created_at: :desc)
  end

  def destroy
    if @foodstuff.destroy
      render :create
    end
  end


 

  private

  def foodstuff_params
    params.require(:foodstuff).permit(:material, :quantity).merge(recipe_id: params[:recipe_id])
  end
  
  def set_foodstuff
    @foodstuff = Foodstuff.find(params[:id])
  end

end