class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user)
    # @comments = Comment.where(post_id: @posts, author_id: @user)
  end

  def show
    @post = Post.find_by!(id: params[:id], author_id: params[:user_id])
  end
end
