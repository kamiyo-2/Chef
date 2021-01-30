class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :nonreleases]

  def show
    @recipe = @user.recipes
  end
  
  def edit
    if @user != current_user
    end
  end

  def update
    @user.valid?
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy 
    @user.destroy
    redirect_to root_path
  end

  def nonreleases
    @recipes = @user.recipes.order("created_at DESC")
  end

  private
  def user_params
    params.require(:user).permit(:name, :user_image, :profile, :department,:email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

