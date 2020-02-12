require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before :each do
    @user = User.create!(name: 'Foo', lastname: 'Bar', email: 'goobar@example.org', password: 'foobar', password_confirmation: 'foobar')
    @user2 = User.create!(name: 'Michael', lastname: 'Scott', email: 'michaelscott@example.org', password: '123456', password_confirmation: '123456')
    @friendship1 = Friendship.create!(user_id: @user.id, friend_id: @user2.id, friendship_status: false)
  end

  context 'with valid details' do
    it 'should create a friendship' do
      expect(@friendship1).to be_valid
    end

    it 'should create an inverse friendship' do
      expect(@user2.inverse_friendships).not_to be_empty
    end
  end
end
