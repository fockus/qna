require 'rails_helper'

feature 'User sign up', %q{
  In order to be able to ask question
  As an user
  I want to be able to sign up
} do

  given(:user) { create :user }

  scenario 'New user try to sign up' do

    visit new_user_registration_path
    fill_in 'Email', with: 'test_sign_up@test.com'
    fill_in 'Password', with: 'qwerty123', :match => :prefer_exact
    fill_in 'Password confirmation', with: 'qwerty123', :match => :prefer_exact
    click_button 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'

    visit new_user_session_path

    expect(current_path).to eq root_path
  end

  scenario 'Registered user try to sign up' do
    sign_up user

    expect(page).to have_content 'has already been taken'
  end

end