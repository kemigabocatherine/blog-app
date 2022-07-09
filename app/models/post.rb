class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user, class_name: 'User'

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  after_save :post_updater

  private

  def post_updater
    user.increment!(:posts_counter)
  end
end
