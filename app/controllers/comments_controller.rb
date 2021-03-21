class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to aqua_path(@comment.aqua)
    else
      @aqua = @comment.aqua
      @comments = @aqua.comments.includes(:user)
      render "aquas/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id,aqua_id: params[:aqua_id])
  end
end
