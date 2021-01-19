class RecipephotosController < ApplicationController

  def create
    @recipe = Recipe.find params[:recipe_id]
    @recipephoto = Recipephoto.new(recipephoto_params)
    if @recipephoto.save
      render :create
    end
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
