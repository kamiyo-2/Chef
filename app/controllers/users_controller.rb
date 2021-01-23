class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @recipe = @user.recipes
  end
  
  def edit
    @user = User.find(params[:id])
    if @user != current_user
    end
  end

  def update
    @user = User.find(params[:id])
    @user.valid?
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました。"
    else
      render :edit
    end
  end

  def destroy 
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def nonreleases
    @user = User.find(params[:id])
    @recipes = @user.recipes
  end

  private
  def user_params
    params.require(:user).permit(:name, :user_image, :profile, :department,:email)
  end
end

