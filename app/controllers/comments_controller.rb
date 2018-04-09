class CommentsController < ApplicationController
  before_action :set_commentable

  def create
    @comment = @commentable.comments.new comment_params
    @comment.author = current_user
    task_id = params[:task_id].present? ? params[:task_id] : @commentable.task_id
    @comment.task_id = task_id

    if @comment.save
      redirect_back fallback_location: root_path
    else
      redirect_back fallback_location: root_path
    end
  end

private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_commentable
    @commentable =
      if params[:task_id]
        Task.find(params[:task_id])
      elsif params[:comment_id]
        Comment.find(params[:comment_id])
      end
  end

end
