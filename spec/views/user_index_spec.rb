require 'rails_helper'

RSpec.describe 'Show User', type: :feature do
  describe 'User' do
    before(:each) do
      @user = User.create!(name: 'Tom', photo: 'https://unsplash.com/photos/F_0BxGuVvo',
                           bio: 'Teacher from Mexico.', posts_counter: 0)

      @user2 = User.create!(name: 'James', photo: 'https://unsplash.com/photos/F_0BxGuVvo',
                            bio: 'Teacher from Ghana.', posts_counter: 0)

      visit users_path
    end

    it 'shows the username of all other users' do
      expect(page).to have_content('Tom')
      expect(page).to have_content('James')
    end

    it 'To show number of posts each user has written' do
      expect(page).to have_content('Number of posts: 0')
    end
  end
end
