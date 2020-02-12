require 'rails_helper'

RSpec.feature 'Integrations', type: :feature do
  before :each do
    user = User.create!(name: 'Foo', lastname: 'Bar', email: 'goobar@example.org', password: 'foobar', password_confirmation: 'foobar')
    user_2 = User.create!(name: 'Michael', lastname: 'Scott', email: 'michael@example.org', password: '123456', password_confirmation: '123456')
    user_3 = User.create!(name: 'Jim', lastname: 'Harper', email: 'jimharper@example.org', password: '123456', password_confirmation: '123456')
    friendship = Friendship.create!(user_id: user_2.id, friend_id: user.id, friendship_status: false)

    visit new_user_session_path
    expect(page.current_path).to eq '/users/sign_in'
    page.fill_in 'Email', with: 'goobar@example.org'
    page.fill_in 'Password', with: 'foobar'
    click_button 'Log in'
    expect(page.current_path).to eq authenticated_root_path
    expect(page).to have_text 'Signed in successfully.'
    click_on 'Users'
    expect(page.current_path).to eq '/users'
  end

  scenario 'Create a Friend Request' do
    have_button 'Add Friend'
    click_on 'Add Friend'
    expect(page).to have_text 'Friendship request successfull'
    have_button 'Cancel Request Sent'
  end

  scenario 'Accept a Friend Request' do
    have_button 'Accept Request'
    have_button 'Cancel Request'
    click_on 'Accept Request'
    expect(page).to have_text 'Friendship request accepted'
    have_button 'Remove'
    have_button 'Go to My Friend\'s Profile'
  end

  scenario 'Reject a Friend Request' do
    have_button 'Accept Request'
    have_button 'Cancel Request'
    click_on 'Cancel Request'
    expect(page).to have_text 'Friendship request canceled'
    have_button 'Add Friend'
  end
end
