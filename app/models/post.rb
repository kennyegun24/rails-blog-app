class Post < ApplicationRecord
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_save :update_PostCounter

  def update_posts_counter
    author.update(PostCounter: author.posts.count)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
