require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(id: 1, Name: 'Kenny', Bio: 'I am the greatest being alive',
                     Photo: 'https://google.com/googleIcon.png')

    @post = Post.new(id: 1, title: 'Love', text: 'My everthing', author: @user, author_id: 1)

    @comment = Comment.new(author: @user, post: @post, text: 'Is she not beautiful?')
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

  it 'update comment counter' do
    expect(@comment.update_comment_counter).to be(true)
  end
end
