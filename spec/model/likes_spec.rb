require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(id: 1, Name: 'Kenny', Bio: 'I am the greatest being alive', PostCounter: 1,
                     Photo: 'https://google.com/googleIcon.png')

    @post = Post.new(title: 'Love', text: 'My everthing', author_id: 1, CommentCounter: 1, LikesCounter: 1)
  end

  it 'comment counter to match' do
    Like.create(author_id: @user, post_id: @post)
    expect(@post.LikesCounter).to eq 1
  end
end
