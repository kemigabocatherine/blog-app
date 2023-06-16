class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post

  after_save :comment_updater

  private

  def comment_updater
    post.increment!(:comments_counter)
  end
end
