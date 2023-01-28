require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(id: 1, Name: 'Kenny', Bio: 'I am the greatest being alive', PostCounter: 1,
                     Photo: 'https://google.com/googleIcon.png')

    @post = Post.new(title: 'Love', text: 'My everthing', author_id: 1, CommentCounter: 1, LikesCounter: 0)
  end

  it 'title must not be blank' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'comment counter to match' do
    @post.CommentCounter = -1
    expect(@post).to_not be_valid
  end

  it 'likes counter to match' do
    @post.LikesCounter = -1
    expect(@post).to_not be_valid
  end

  it 'Check if CommentCounter is an integer' do
    @post.CommentCounter = 'Random'
    expect(@post).to_not be_valid
  end

  it 'Check if like count is an integer' do
    @post.LikesCounter = 'data'
    expect(@post).to_not be_valid
  end
end
