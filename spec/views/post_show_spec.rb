require 'rails_helper'

RSpec.describe 'Show User', type: :feature do
  describe 'Post' do
    before(:each) do
      @user = User.create!(name: 'Thomas', photo: 'https://unsplash.com/photos/F_0BxGuVvo',
                           bio: 'Teacher from Hungary.', posts_counter: 0)

      @user2 = User.create!(name: 'Jinding', photo: 'https://unsplash.com/photos/F_0BxGuVvo',
                            bio: 'Teacher from Jamaica.', posts_counter: 0)

      @post = @user.posts.create!(title: 'My post', text: 'this is my first post')

      @post2 = @user2.posts.create!(title: 'Last post', text: 'this is my last post',
                                    comments_counter: 0, likes_counter: 0)

      @comment = @post.comments.create!(text: 'This is a comment for a post', user_id: @user.id)
      @comment2 = @post2.comments.create!(text: 'This is a comment for the second user', user_id: @user2.id)

      @like = @post.likes.create!(user_id: @user.id)
      @like2 = @post2.likes.create!(user_id: @user2.id)

      visit user_posts_path(@user)
    end

    it 'shows the post title' do
      expect(page).to have_content('My post')
    end

    it 'shows the username' do
      expect(page).to have_content('Thomas')
    end

    it 'shows the post body' do
      expect(page).to have_content('this is my first post')
    end

    it 'shows number of comments' do
      expect(page).to have_content('Comments: 1')
    end

    it 'shows username of each commenter' do
      expect(page).to have_content('Thomas')
    end

    it 'shows all the comments' do
      expect(page).to have_content('This is a comment for a post')
    end

    it 'shows number of likes' do
      expect(page).to have_content('Likes: 1')
    end
  end
end
