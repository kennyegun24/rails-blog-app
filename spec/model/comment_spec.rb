require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(id: 1, Name: 'Kenny', Bio: 'I am the greatest being alive', PostCounter: 1,
                     Photo: 'https://google.com/googleIcon.png')

    @post = Post.new(id: 1, title: 'Love', text: 'My everthing', author: @user, author_id: 1, CommentCounter: 1,
                     LikesCounter: 0)

    @comment = Comment.new(user: @user, posts: @post, text: 'Is she not beautiful?')
  end

  it 'check if user is valid' do
    expect(@user).to be_valid
  end

  it 'check if post is valid' do
    expect(@post).to be_valid
  end

  it 'check if comment is valid' do
    expect(@comment).to be_valid
  end
end
