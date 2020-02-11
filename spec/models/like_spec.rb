require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = User.create!(name: 'Foo', lastname: 'Bar', email: 'goobar@example.org', password: 'foobar', password_confirmation: 'foobar')
    @post = Post.create!(content: 'Content', author: @user.id)
    @comment = Comment.create!(text: "Text Comment", user_id: @user.id, post_id: @post.id)
    @like_1 = Like.create!(user_id: @user.id, likeable_id: @post.id, likeable_type: "Post")
    @like_2 = Like.create!(user_id: @user.id, likeable_id: @comment.id, likeable_type: "Comment")
  end

  context 'with valid details' do
    it 'should create a like in a post' do
      expect(@like_1).to be_valid
    end

    it 'should create a like in a comment' do
      expect(@like_2).to be_valid
    end
  end
end
