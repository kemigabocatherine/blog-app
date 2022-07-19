require 'rails_helper'

RSpec.describe 'Show User', type: :feature do
  describe 'Post' do
    before(:each) do
      @user = User.create!(name: 'John', photo: 'https://unsplash.com/photos/F_0BxGuVvo',
                           bio: 'Teacher from USA.', postscounter: 0)

      @user2 = User.create!(name: 'James', photo: 'https://unsplash.com/photos/F_0BxGuVvo',
                            bio: 'Teacher from Ghana.', postscounter: 0)

      @post = @user.posts.create!(title: 'My post', text: 'this is my first post')

      @comment = @post.comments.create!(text: 'This is a comment for a post', user_id: @user.id)

      @like = @post.likes.create!(user_id: @user.id)

      visit user_posts_path(@user)
    end

    it 'shows the profile photo' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end

    it 'shows the username' do
      expect(page).to have_content('John')
    end

    it 'shows the number of posts' do
      expect(page).to have_content('Number of posts: 1')
    end

    it 'shows the post title' do
      expect(page).to have_content('My post')
    end

    it 'shows the post text' do
      expect(page).to have_content('this is my first post')
    end

    it 'should have comment' do
      expect(page).to have_content('This is a comment for a post')
    end

    it 'shows number of comments' do
      expect(page).to have_content('Comments: 1')
    end

    it 'shows number of likes' do
      expect(page).to have_content('Likes: 1')
    end

    it 'has link to post show page' do
      click_link 'My post'
      expect(page).to have_current_path user_post_path(@post.user_id, @post)
    end
  end
end
