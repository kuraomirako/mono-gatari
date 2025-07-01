class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to story_path(@comment.story_id)
    else
      redirect_to story_path(@comment.story_id)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to story_path(@comment.story_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_box).merge(user_id: current_user.id, story_id: params[:story_id])
  end

end