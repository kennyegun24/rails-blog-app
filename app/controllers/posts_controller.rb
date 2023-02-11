class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user)
    # @comments = Comment.where(post_id: @posts, author_id: @user)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find_by!(id: params[:id], author_id: params[:user_id])
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.author_id = current_user.id
    # @post.user_id = current_user.id
    if @post.save
      flash[:notice] = 'Post successfully created!'
      redirect_to user_posts_path(current_user)
    else
      flash.now[:error] = 'Error: Error occurred when creating post'
      render :new
    end
  end

  private

  def post_params
    params.require(:new_post).permit(:title, :text)
  end
end
