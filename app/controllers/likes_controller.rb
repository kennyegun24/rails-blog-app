class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(author_id: current_user.id, post_id: params[:post_id])
    redirect_to user_post_path(current_user, @post) if @like.save
  end
end
