class CommentsController < ApplicationController
  before_action :find_commentable

  def create
    @comment = @commentable.comments.new comment_params
    @comment.author_id = current_user.id

    @comment.save
    redirect_back fallback_location: root_path 
  end

private

  def comment_params
    params.require(:comment).permit(:body, :task_id)
  end

  def find_commentable
    @commentable = Comment.find(params[:comment_id]) if params[:comment_id]
    @commentable = Task.find(params[:task_id]) if params[:task_id]
  end

end
