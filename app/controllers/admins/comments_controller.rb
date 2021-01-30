class Admins::CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render :create
    else
      render :errors
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy!
      render :create
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, recipe_id: params[:recipe_id])
  end
end