require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    context 'when page is opened ' do
      before :each do
        @user = User.create(Name: 'Kenny', Photo: 'https://kennyegun.com', Bio: 'Kenny')
        get "/users/#{@user.id}/posts"
      end
      it 'return a correct response' do
        expect(response).to have_http_status(200)
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'GET /show' do
    context 'when page is opened ' do
      before :each do
        @user = User.create(Name: 'Kenny', Photo: 'https://kennyegun.com', Bio: 'Kenny')
      end
      it 'return a correct response' do
        @post = Post.create(author: @user, title: 'Kenny', text: 'Kenny is')
        get "/users/#{@user.id}/posts/#{@post.id}"
        expect(response).to have_http_status(200)
        expect(response).to render_template(:show)
      end
    end
  end
end