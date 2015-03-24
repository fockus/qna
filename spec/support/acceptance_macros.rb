module AcceptanceMacros
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password, :match => :prefer_exact
    click_button 'Sign in'
  end

  def sign_up(user)
    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password, :match => :prefer_exact
    fill_in 'Password confirmation', with: user.password_confirmation, :match => :prefer_exact
    click_button 'Sign up'
  end
end