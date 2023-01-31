require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(id: 1, Name: 'Kenny', Bio: 'I am the greatest being alive', PostCounter: 1,
                     Photo: 'https://google.com/googleIcon.png')

    @post = Post.new(title: 'Love', text: 'My everthing', author_id: 1, CommentCounter: 1, LikesCounter: 1)
    @like = Like.create(author: @user, post: @post)

  end

  it 'comment counter to match' do
    expect(@post.LikesCounter).to eq 1
  end
  
  it 'update like counter' do
    expect(@like.update_likes_counter).to be(true)
  end
end
