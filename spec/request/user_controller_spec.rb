require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    context 'when page is opened ' do
      it 'has to return a correct response' do
        get '/users'
        expect(response).to have_http_status(200)
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'GET /show' do
    context 'when page is open' do
      before :each do
        @user = User.create(Bio: 'Kenny', Name: 'Kenny', Photo: 'https://kennyegun.com')
        get "/users/#{@user.id}"
      end
      it 'has to return a correct response' do
        expect(response).to have_http_status(200)
        expect(response).to render_template(:show)
      end
    end
  end
end
