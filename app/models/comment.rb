class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  before_save :update_comment_counter

  def update_comment_counter
    post.update(CommentCounter: post.comments.all.length)
  end
end
