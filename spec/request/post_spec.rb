require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    context 'when page is opened ' do
      it 'return a correct response' do
        get '/users/:user_id/posts'
        expect(response).to have_http_status(200)
        expect(response).to render_template(:index)
        expect(response.body).to include('Lists of all posts')
      end
    end
  end

  describe 'GET /show' do
    context 'when page is opened ' do
      it 'return a correct response' do
        get '/users/:user_id/posts/:id'
        expect(response).to have_http_status(200)
        expect(response).to render_template(:show)
        expect(response.body).to include('Shows info of a single post')
      end
    end
  end
end
