class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
    @recipe = @user.recipes
  end
  
  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admins_users_path(@user)
    else
      render :edit
    end
  end

  def destroy 
    @user.destroy
    redirect_to admins_users_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :user_image, :profile, :department,:email)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end