require 'rails_helper'

RSpec.describe 'Show User', type: :feature do
  describe 'User' do
    before(:each) do
      @user = User.create!(name: 'Tom', photo: 'https://unsplash.com/photos/F_0BxGuVvo',
                           bio: 'Teacher from Mexico.', postscounter: 0)

      @post1 = @user.posts.create!(title: 'Studying at Microverse',
                                   text: 'My experience', comments_counter: 0, likes_counter: 0)

      visit user_path(@user.id)
    end
    it 'shows photo' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end

    it 'shows the username' do
      expect(page).to have_content('Tom')
    end

    it 'shows number of posts for each user' do
      expect(page).to have_content('Number of posts: 1')
    end

    it 'shows the users bio' do
      expect(page).to have_content('Teacher from Mexico')
    end

    it 'Should see the user\'s posts.' do
      expect(page).to have_content 'My experience'
    end

    it 'Can see a button that lets me view all of a users posts' do
      expect(page).to have_content('See all posts')
    end

    it 'When I click to see all posts, it redirects me to the users posts index page.' do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@user.id)
    end
  end
end
