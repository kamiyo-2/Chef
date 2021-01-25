class Admins::RecipephotosController < ApplicationController

  def create
    @recipe = Recipe.find params[:recipe_id]
    @recipephoto = Recipephoto.new(recipephoto_params)
    if @recipephoto.save
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
    @recipephotos = @recipe.recipephotos.order(created_at: :desc)
  end
  

  def destroy
    @recipephoto = Recipephoto.find(params[:id]) 
    if @recipephoto.destroy!
      render :create
    end
  end

  
  private
  def recipephoto_params
    params.require(:recipephoto).permit(:text, :sub_image).merge(recipe_id: params[:recipe_id])
  end

end
