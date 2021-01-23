class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recipe = @user.recipes
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admins_users_path(@user)
    else
      render :edit
    end
  end

  def destroy 
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_users_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :user_image, :profile, :department,:email)
  end
end