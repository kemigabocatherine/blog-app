class ResetDefaultPostsCounter < ActiveRecord::Migration[7.0]
  def change
    change_column_default :posts, :comments_counter, from: nil, to: 0
    # change_column_null :posts, :comments_counter, false
  end
end
