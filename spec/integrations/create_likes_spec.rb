require 'rails_helper'

RSpec.feature 'Integrations', type: :feature do
  before :each do
    user = User.create!(name: 'Foo', lastname: 'Bar', email: 'goobar@example.org', password: 'foobar', password_confirmation: 'foobar')
    post = Post.create!(content: 'Content', author: user.id)
    post.save
    visit new_user_session_path
    expect(page.current_path).to eq '/users/sign_in'
    page.fill_in 'Email', with: 'goobar@example.org'
    page.fill_in 'Password', with: 'foobar'
    click_button 'Log in'
    expect(page.current_path).to eq authenticated_root_path
    expect(page).to have_text 'Signed in successfully.'
  end

  scenario 'Create a like on Timeline' do
    click_button 'Like'
    expect(page).to have_text 'Liked!'
    click_button 'Unlike'
    expect(page).to have_text 'Unliked!'
  end

  scenario 'Create a like on User Profile\'s Post' do
    click_on 'Profile'
    click_button 'Like'
    expect(page.current_path).to eq authenticated_root_path
    expect(page).to have_text 'Liked!'
    click_on 'Profile'
    click_button 'Unlike'
    expect(page.current_path).to eq authenticated_root_path
    expect(page).to have_text 'Unliked!'
  end
end
