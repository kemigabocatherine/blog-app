class RemovePostsIdFromComment < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :posts_id
    remove_column :comments, :author_id
  end
end
