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
      visit user_posts_path(@user.id)
    end

    it 'Should return each user with an image' do
      expect(page).to have_css("img[src*='#{@user.Photo}']")
    end

    it 'Should return the each user userName' do
      expect(page).to have_content(@user.Name.to_s)
    end

    it 'Should return the number of posts per user' do
      expect(page).to have_content(@user.PostCounter)
    end

    it 'Should have a post titkle' do
      expect(page).to have_content(@post.title)
    end
    it 'Should have a post titkle' do
      expect(page).to have_content(@post.text.slice(0, 30))
    end
    it 'Should have a post titkle' do
      expect(page).to have_content(@post.five_recent_comments.first.text)
    end
    it 'Should have a post titkle' do
      expect(page).to have_content(@post.CommentCounter)
    end
    it 'Should have a post titkle' do
      expect(page).to have_content(@post.LikesCounter)
    end

    it 'Can see a pagination button if there are more posts than fit' do
      expect(page).to have_content('Pagination')
    end

    it 'Should have a post titkle' do
      expect("#{page.current_url}/#{@post.id}").to match user_post_path(@user.id, @post.id)
    end
  end
end
