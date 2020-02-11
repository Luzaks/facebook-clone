require 'rails_helper'

RSpec.feature 'Integrations', type: :feature do
    before :each do
      user = User.create!(name: 'Foo', lastname: 'Bar', email: 'goobar@example.org', password: 'foobar', password_confirmation: 'foobar')
      user_2 = User.create!(name: 'Michael', lastname: 'Schott', email: 'michael@example.org', password: '123456', password_confirmation: '123456')
      post = Post.create!(content: 'Content', author: user.id)
      post_2 =Post.create!(content: 'Content', author: user_2.id)
      comment = Comment.create!(text: 'Text Comment', user_id: user.id, post_id: post.id)
      comment_2 = Comment.create!(text: 'Another Text', user_id: user.id, post_id: post_2.id)
      comment.save
      visit new_user_session_path
        expect(page.current_path).to eq '/users/sign_in'
        page.fill_in 'Email', with: 'goobar@example.org'
        page.fill_in 'Password', with: 'foobar'
        click_button 'Log in'
        expect(page.current_path).to eq authenticated_root_path
        expect(page).to have_text 'Signed in successfully.'
    end
  

    scenario 'Create a comment on current user profile page' do
        click_on 'Profile'
        page.fill_in 'comment_text', with: 'Text Comment'
        click_button 'Write a comment.'
        expect(page.current_path).to eq authenticated_root_path
        expect(page).to have_text 'Comment created!'
      end

    
      scenario 'Create a comment on another user profile page' do
        click_on 'Users'
        click_on 'Michael'
        page.fill_in 'comment_text', with: 'Another Text'
        click_button 'Write a comment.'
        expect(page.current_path).to eq authenticated_root_path
        expect(page).to have_text 'Comment created!'
      end
    end