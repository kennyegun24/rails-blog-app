class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :posts, class_name: 'Post', foreign_key: 'post_id'

  after_save :update_comment_counter

  def update_comment_counter
    author.update(CommentCounter: posts.comments.count)
  end
end
