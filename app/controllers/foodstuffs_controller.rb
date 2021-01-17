class FoodstuffsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foodstuff = Foodstuff.new
    @foodstuffs = @recipe.foodstuffs.order(created_at: :desc)
  end


  def create
    @recipe = Recipe.find params[:recipe_id]
    @foodstuff = Foodstuff.new(foodstuff_params)
    @foodstuffs = @recipe.foodstuffs.order(created_at: :desc)
    if @foodstuff.save!
      render :create
    end
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @foodstuffs = Foodstuff.where(recipe_id: @recipe.id)
    @foodstuff = Foodstuff.new
  end

  def destroy
    @foodstuff = Foodstuff.find(params[:id]) #⑤
    if @foodstuff.destroy!
      render :create
    end
  end

  

  private
  def foodstuff_params
    params.require(:foodstuff).permit(:material, :quantity).merge(recipe_id: params[:recipe_id])
  end
  
end