class RemovePostsIdFromLike < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :posts_id
    remove_column :likes, :author_id
  end
end
