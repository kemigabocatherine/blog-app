require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Cathy', photo: 'image', bio: 'My favorite', posts_counter: 0)
    @user.save
  end

  describe 'User Model Properties' do
    it 'name should be present' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'should have a photo' do
      @user.photo = 'photo'
      expect(@user).to be_valid
    end

    it 'should have a bio' do
      @user.bio = 'bio'
      expect(@user).to be_valid
    end

    it 'posts_counter should be greater than or equal to 0' do
      @user.posts_counter = nil
      expect(@user).to_not be_valid
    end
  end
end