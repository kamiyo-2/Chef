class RecipephotosController < ApplicationController
  before_action :set_recipephoto, only: [:edit, :destroy]

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
    @foodstuff = Foodstuff.new
    @foodstuffs = @recipe.foodstuffs
    @recipephoto = Recipephoto.new
    @recipephotos = @recipe.recipephotos.order(created_at: :desc)
  end
  

  def destroy
    if @recipephoto.destroy!
      render :create
    end
  end

  
  private

  def recipephoto_params
    params.require(:recipephoto).permit(:text, :sub_image).merge(recipe_id: params[:recipe_id])
  end

  def set_recipephoto
    @recipe = Recipe.find params[:recipe_id]
  end

end
