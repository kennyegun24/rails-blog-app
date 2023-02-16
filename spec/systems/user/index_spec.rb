require 'rails_helper'

RSpec.describe 'Posts index view', type: :system do
  describe 'Index page' do
    before(:each) do
      @user = User.create(Name: 'Kenny',
                          Photo: 'https://img.freepik.com/free-psd/save-world-reusable-grocery-bag-mockup_53876-98827.jpg?', Bio: 'Kenny elias')
      @post = Post.create(text: 'ken', title: 'ken', author: @user)
      visit users_path
      @users = User.all
    end

    it 'Should return each user with an image' do
      @users.each do |comment|
        expect(page).to have_css("img[src*='#{comment.Photo}']")
      end
    end

    it 'Should return the each user userName' do
      @users.each do |comment|
        expect(page).to have_content(comment.Name.to_s)
      end
    end

    it 'Should return the number of posts per user' do
      @users.each do |comment|
        expect(page).to have_content(comment.PostCounter)
      end
    end

    it 'Should have a post titkle' do
      expect("#{page.current_url}/#{@user.id}").to match users_path(@user.id)
    end
  end
end
