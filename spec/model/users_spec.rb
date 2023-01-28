require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(id: 1, Name: 'Kenny', Bio: 'I am the greatest being alive', PostCounter: 1,
                     Photo: 'https://google.com/googleIcon.png')
  end

  it 'name must not be blank' do
    @user.Name = nil
    expect(@user).to_not be_valid
  end

  it 'user bio to match' do
    @user.Bio = 'Kenny is a boy'
    expect(@user).to be_valid
  end

  it 'Check if postscounter is an integer' do
    @user.PostCounter = 'Random'
    expect(@user).to_not be_valid
  end

  describe 'check methods' do
    before do
      @user1 = User.create(Name: 'Ken', Photo: 'https://ww.googlecom/google,png', Bio: 'I ama  gauas', PostCounter: 1)

      5.times do
        Post.create(title: 'Love', text: 'My everthing', author_id: 1, CommentCounter: 1, LikesCounter: 0)
      end
    end

    it 'returns last 3posts' do
      expect(@user1.three_posts).to match_array(@user1.posts.last(3))
    end
  end
end
