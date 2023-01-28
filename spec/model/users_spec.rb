require 'rails_helper'

RSpec.describe User, type: :model do
    before :each do
        @user = User.new(id: 1, Name: 'Kenny', Bio: 'I am the greatest being alive', PostCounter: 1, Photo: 'https://google.com/googleIcon.png' )
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
end