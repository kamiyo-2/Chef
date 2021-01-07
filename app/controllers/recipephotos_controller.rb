class RecipephotosController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foodstuffs = Foodstuff.where(recipe_id: @recipe.id)
    @recipephoto = Recipephoto.new
  end

  def create
    @recipephoto = Recipephoto.new(recipephoto_params)
    if @recipephoto.save
      redirect_to recipe_path(@recipephoto.recipe)
    else
      @recipe = @recipephoto.recipe
      @recipephotos = @recipe.recipephotos
      render "recipes/show"
    end
  end
  
  private
  def recipephoto_params
    params.require(:recipephoto).permit(:text, :sub_image).merge(recipe_id: params[:recipe_id])
  end

end
