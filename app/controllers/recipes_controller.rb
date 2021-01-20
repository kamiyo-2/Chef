class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.valid?
    if @recipe.save
      redirect_to recipe_detail_recipe_path(@recipe.id)
    else
      redirect_to new_recipe_path(@recipe.id)
    end
  end

  def recipe_detail
    @recipe = Recipe.find(params[:id])
    @foodstuff = Foodstuff.new
    @foodstuffs = @recipe.foodstuffs
    @recipephoto = Recipephoto.new
    @recipephotos = @recipe.recipephotos.order(created_at: :desc)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foodstuff = Foodstuff.new
    @foodstuffs = @recipe.foodstuffs
    @recipephoto = Recipephoto.new
    @recipephotos = @recipe.recipephotos.order(created_at: :desc)
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @foodstuff = Foodstuff.new
    @foodstuffs = @recipe.foodstuffs
    @recipephoto = Recipephoto.new
    @recipephotos = @recipe.recipephotos.order(created_at: :desc)
    if @recipe.user != current_user
      render :edit
    end
  end

  def update
    recipe = Recipe.find(params[:id])
    if recipe.update(recipe_params)
      redirect_to recipe_path(recipe.id), method: :get
    else
      render :edit
    end
  end

  def release
    recipe =  Recipe.find(params[:id])
    recipe.released! unless recipe.released?
    redirect_to edit_recipe_path(recipe), notice: 'この作品を公開しました'
  end

  def nonrelease
    recipe =  Recipe.find(params[:id])
    recipe.nonreleased! unless recipe.nonreleased?
    redirect_to edit_recipe_path(recipe), notice: 'この作品を非公開にしました'
  end


  private
  def recipe_params
    params.require(:recipe).permit(:title, :process, :details, :main_image, tag_ids: []).merge(user_id: current_user.id)
  end
 
end

