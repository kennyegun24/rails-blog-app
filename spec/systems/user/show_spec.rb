require 'rails_helper'

RSpec.describe 'Posts index view', type: :system do
  describe 'Index page' do
    before(:each) do
      @user = User.create(Name: 'Kenny',
                          Photo: 'https://img.freepik.com/free-psd/save-world-reusable-grocery-bag-mockup_53876-98827.jpg?', Bio: 'Kenny elias')
      @post = Post.create(text: 'ken', title: 'ken', author: @user)
      Comment.create(post: @post, author: @user, text: 'Amazing post Tom')
      Comment.create(post: @post, author: @user, text: 'Awesome post Tom')
      Comment.create(post: @post, author: @user, text: 'Great post Tom')
      @posts = Post.all
      visit user_path(@user.id)
    end

    it 'Should have a post titkle' do
      expect("#{page.current_url}/#{@post.id}").to match users_path(@user.id)
    end

    it 'expect page to have user profile photo' do
      expect(page).to have_css("img[src*='#{@user.Photo}']")
    end

    it 'expect username to display' do
      expect(page).to have_content(@user.Name)
    end

    it '' do
      expect(page).to have_content(@user.PostCounter)
    end

    it '' do
      expect(page).to have_content(@user.Bio)
    end

    it '' do
      @user.posts.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end

    it '' do
      expect(page).to have_content('See all posts')
    end

    it do
      expect("#{page.current_url}/posts").to match user_posts_path(@user.id)
    end

    it do
      expect("#{page.current_url}/posts/#{@post.id}").to match user_posts_path(@user, @post)
    end
  end
end
