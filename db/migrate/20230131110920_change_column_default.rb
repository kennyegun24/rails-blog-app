class ChangeColumnDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :posts, :CommentCounter, 0
    change_column_default :posts, :LikesCounter, 0
    change_column_default :users, :PostCounter, 0
  end
end
