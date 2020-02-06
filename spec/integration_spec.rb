require 'rails_helper'

RSpec.feature 'Integrations', type: :feature do
  before :each do
    user = User.create!(name: 'Foo', lastname: 'Bar', email: 'goobar@example.org', password: 'foobar', password_confirmation: 'foobar')
    post = user.posts.build(content: 'Content')
    post.save
  end
  scenario 'Log in, Create a Post and Log out a user' do
    visit new_user_session_path
    expect(page.current_path).to eq '/users/sign_in'
    page.fill_in 'Email', with: 'goobar@example.org'
    page.fill_in 'Password', with: 'foobar'
    click_button 'Log in'
    expect(page.current_path).to eq authenticated_root_path
    expect(page).to have_text 'Signed in successfully.'
    have_button 'Publish'
    page.fill_in 'post_content', with: 'Content'
    click_button 'Publish'
    expect(page).to have_text 'post created!'
    have_link 'Edit profile'
    have_link 'Logout'
    click_on 'Logout'
    expect(page.current_path).to eq '/'
  end
end
