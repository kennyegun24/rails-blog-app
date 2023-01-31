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

  describe 'Check for post methods' do
    before do
      @user2 = User.create(id: 1, Name: 'Kenny', Bio: 'I am the greatest being alive', PostCounter: 1, Photo: 'https://google.com/googleIcon.png')

      @post2 = Post.create(title: 'Love', text: 'My everthing', author: @user2, CommentCounter: 0, LikesCounter: 0)

      6.times do
        Comment.create(author: @user2, post: @post2, text: 'Is she not beautiful?')
      end
    end

    it 'return array of 5 recent comments' do
      expect(@post).to respond_to(:five_recent_comments)
    end

    it 'should return array of 5' do
      expect(@post2.five_recent_comments.length).to eql(5)
    end

    it 'should not return an empty array' do
      expect(@post2.five_recent_comments.length).to_not eql(0)
    end
  end
end
