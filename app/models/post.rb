class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 250 }
  validates :CommentCounter, :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :update_post_counter

  def update_post_counter
    author.update(PostCounter: author.posts.all.length)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
