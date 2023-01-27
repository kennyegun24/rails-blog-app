class Like < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :posts, class_name: 'Post', foreign_key: 'post_id'

  after_save :update_LikesCounter

  def update_likes_counter
    author.update(LikesCounter: author.likes.count)
  end
end
