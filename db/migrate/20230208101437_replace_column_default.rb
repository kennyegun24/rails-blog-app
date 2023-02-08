class ReplaceColumnDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :PostCounter, 0
  end
end
