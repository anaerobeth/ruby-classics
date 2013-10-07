require 'spec_helper'

feature 'user signs in',%Q{
  As a Rubyist
  I want sign in to my account
  So that I can comment and rate a posting
} do

# ACCEPTANCE CRITERIA
#
# I must specify email and password
# If I don't specify the required information I am shown an error
# and prompted to re-enter the information
# If I am successful, I am greeted with a message, logged in, and brought to the home page

  scenario 'registered user signs in with valid information' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'

    page.should have_content('Please enter your email and password')

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password

    click_button 'Sign In'

    page.should have_content('Signed in successfully.')
    page.should have_content('Sign Out')

    page.should_not have_content('Sign In')
    page.should_not have_content('Sign Up')

  end

  scenario 'unregistered user tries to sign in' do
    visit root_path
    click_link 'Sign In'

    fill_in 'user_email', with: 'notregistered@gmail.com'
    fill_in 'user_password', with: 'notregpassword'

    click_button 'Sign In'

    page.should_not have_content('Welcome!')
    page.should have_content('Sign In')
    page.should_not have_content('Sign Out')

  end

  scenario 'registered user enters wrong password' do
    user = FactoryGirl.create(:user)
    user.password = 'wrongpassword'

    visit root_path
    click_link 'Sign In'

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password

    click_button 'Sign In'

    page.should have_content('Invalid email or password')
    page.should have_content('Sign In')

    page.should_not have_content('Sign Out')
  end

end