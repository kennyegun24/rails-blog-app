class Post < ApplicationRecord
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :title, presence: true, length: {maximum: 250}
  validates :CommentCounter, :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0}

  after_save :update_PostCounter

  def update_posts_counter
    author.update(PostCounter: author.posts.count)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
