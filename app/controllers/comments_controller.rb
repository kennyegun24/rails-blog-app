class CommentsController < ApplicationController 
  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comments_params)
    comment.author = current_user
    comment.post_id = params[:post_id]
    if comment.save
      redirect_to user_post_path(current_user.id, comment.post_id), notice: 'comment added'
    else
      render :new, alert: 'Failed to post comment, Please try again later'
    end
  end

  def comments_params
    params.require(:comment).permit(:text)
  end
end
