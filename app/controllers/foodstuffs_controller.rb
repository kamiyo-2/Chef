class FoodstuffsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @recipe = Recipe.find params[:recipe_id]
    @foodstuff = Foodstuff.new(foodstuff_params)
    if @foodstuff.save
      render :create
    end
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