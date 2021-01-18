class FoodstuffsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @recipe = Recipe.find params[:recipe_id]
    @foodstuff = @recipe.foodstuffs.build(foodstuff_params)
    if @foodstuff.save
      respond_to do |format|
        format.js { render :file => 'foodstuffs/create.js.erb' }
        
    end

    end
  end



  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @foodstuff = Foodstuff.new
    @foodstuffs = Foodstuff.where(recipe_id: @recipe.id)
  
  end

  def destroy
    @foodstuff = Foodstuff.find(params[:id])
    @foodstuff.destroy
      render :create
  end


 

  private
  def foodstuff_params
    params.require(:foodstuff).permit(:material, :quantity).merge(recipe_id: params[:recipe_id])
  end
  
end