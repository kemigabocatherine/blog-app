class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user, class_name: "User"
end
