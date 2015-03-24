require 'rails_helper'

feature 'User sign out' do

  given(:user) { create :user }

  scenario 'Registered and authorized user try to sign out' do

    sign_in user
    visit root_path
    click_on 'Sign out'
    expect(page).to have_content 'Signed out successfully.'

    click_on 'Sign in', :match => :prefer_exact

    expect(page).to have_selector("input[type='email']")
    expect(page).to have_selector("input[type='password']")
  end
end