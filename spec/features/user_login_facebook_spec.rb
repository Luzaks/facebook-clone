require 'rails_helper'

RSpec.feature 'Omniauth', type: :feature do
  scenario 'Login using Facebook Account' do
    stub_omniauth
    visit unauthenticated_root_path
    expect(page).to have_link('Sign in with Facebook')
    click_on 'Sign in with Facebook'
    expect(page).to have_text('Successfully authenticated from Facebook account.')
    expect(page.current_path).to eq authenticated_root_path
  end
end

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
                                                                  provider: 'facebook',
                                                                  uid: '12345678910',
                                                                  info: {
                                                                    email: 'michaelscoot@example.com',
                                                                    first_name: 'Michael',
                                                                    last_name: 'Scott'
                                                                  },
                                                                  credentials: {
                                                                    token: 'abcdefg12345',
                                                                    refresh_token: '12345abcdefg',
                                                                    expires_at: DateTime.now
                                                                  }
                                                                })
end
