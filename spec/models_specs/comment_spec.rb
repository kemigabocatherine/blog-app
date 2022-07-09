require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.new(name: 'Cathy', photo: 'image', bio: 'Hey', posts_counter: 0)
    @user.save
    @post = Post.new(user: @user, title: 'Post 1', text: 'text 1', comments_counter: 0, likes_counter: 0)
    @post.save
    @comment = Comment.new(post: @post, user: @user, text: 'text 1')
    @comment.save
  end

  describe 'Comment Model Properties' do
    it 'text should be present' do
      @comment.text = 'hello'
      expect(@comment).to be_valid
    end

    it 'user_id should be present' do
      @comment.user = nil
      expect(@comment).to_not be_valid
    end

    it 'post_id should be present' do
      @comment.post = nil
      expect(@comment).to_not be_valid
    end
  end
end
