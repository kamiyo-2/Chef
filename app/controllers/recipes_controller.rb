class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_recipe,           only: [:recipe_detail, :edit, :show, :update, :destroy, :release, :nonrelease]
  before_action :set_recipe_children,  only: [:recipe_detail, :show, :edit]

  def index
    @recipe = Recipe.includes(:user).order("created_at DESC")
  end


  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.valid?
      @recipe.save
      redirect_to recipe_detail_recipe_path(@recipe.id)
    else
      render new_recipe_path(@recipe.id)
    end
  end

  def recipe_detail
  end

  def show
    @comment = Comment.new
    @comments = @recipe.comments
  end

  def edit
    if @recipe.user != current_user
      render :edit
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe.id), method: :get
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path
  end

  def release
    @recipe.released! unless @recipe.released?
    redirect_to recipe_path(@recipe)
  end

  def nonrelease
    @recipe.nonreleased! unless @recipe.nonreleased?
    redirect_to recipe_path(@recipe)
  end

  def search
    @recipes = Recipe.search(params[:search]).order("created_at DESC")
  end
  


  private
  def recipe_params
    params.require(:recipe).permit(:title, :process, :details, :main_image, tag_ids: []).merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_recipe_children
    @foodstuff = Foodstuff.new
    @foodstuffs = @recipe.foodstuffs
    @recipephoto = Recipephoto.new
    @recipephotos = @recipe.recipephotos
  end
 
end

