require 'rails_helper'

RSpec.describe Post, type: :model do
    before :each do
      @user = User.new(name: 'Cathy', photo: 'image', bio: 'Hey', posts_counter: 0)
      @user.save
      @post = Post.new(user: @user, title: 'Post 1', text: 'text 1', comments_counter: 0, likes_counter: 0)
      @post.save
    end

  describe 'Post Model properties' do
    it 'title should be present' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'user_id should be present' do
      @post.user = nil
      expect(@post).to_not be_valid
    end

    it 'comments_counter should be greater than or equal to 0' do
      @post.comments_counter = nil
      expect(@post).to_not be_valid
    end

    it 'likes_counter should be greater than or equal to 0' do
      @post.likes_counter = nil
      expect(@post).to_not be_valid
    end
  end
end