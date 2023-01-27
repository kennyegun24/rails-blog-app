class Comment < ApplicationRecord
    belongs_to :user, class_name: 'User', foreign_key: 'author_id'
    belongs_to :posts, class_name: 'Post', foreign_key: 'post_id'

    after_save :update_CommentCounter


    def update_likes_counter
        author.update(CommentCounter: author.comments.count)
    end
end