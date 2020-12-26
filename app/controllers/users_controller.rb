class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
    if @user != current_user
        redirect_to user_path(current_user), alert: "不正なアクセスです。"
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
  
end