class ChangeFromStringToInteger < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :likes_counter
    add_column :posts, :likes_counter, :integer, default: 0
  end
end
