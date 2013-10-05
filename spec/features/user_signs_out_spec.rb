require 'spec_helper'

feature 'user signs out',%Q{
  As an authenticated Ruby developer
  I want sign out
  So that I can browse the website anonymously
} do

# Acceptance Criteria
#
# If I am signed in, I can sign out
# If I am not signed in, I cannot sign out

  scenario 'a signed in user can sign out' do

    user = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password

    click_button 'Sign In'

    visit root_path
    click_link 'Sign Out'

    page.should have_content('Signed out successfully')
    page.should have_content('Sign In')

    page.should_not have_content('Sign Out')
  end

  scenario 'a non signed in user can not sign out' do
    visit root_path

    page.should_not have_content('Sign Out')
  end
end
