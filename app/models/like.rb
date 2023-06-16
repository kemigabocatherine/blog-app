class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post

  after_save :like_updater

  private

  def like_updater
    post.increment!(:likes_counter)
  end
end
