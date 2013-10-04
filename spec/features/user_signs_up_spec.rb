require 'spec_helper'

feature 'user signs up',%Q{
  As a member of the Ruby community
  I want sign up
  So that I can view and share items useful to developers.
} do

# ACCEPTANCE CRITERIA
#
# I must provide user name, first name, last name, email,
# password, password confirmation
# If I don't specify the required information I am shown an error
# and promted to re-enter the information
# If I am successful, I am greeted with a message, logged in,
# and brought to the home page

scenario 'with valid information' do
    prev_count = User.count

    visit root_path
    click_link 'Sign Up'

    fill_in 'User name', with: 'Rubyist'
    fill_in 'First name', with: 'Ella'
    fill_in 'Last name', with: 'May'
    fill_in 'Email', with: 'ella@gmail.com'
    fill_in 'user_password', with: 'ellapassword'
    fill_in 'user_password_confirmation', with: 'ellapassword'

    click_button 'Sign Up'

    expect( User.count ).to eql( prev_count + 1 )

    page.should have_content('Welcome!')
    page.should have_content('Sign Out')

    page.should_not have_content('Sign Up')
    page.should_not have_content('Sign In')

  end

  scenario 'with invalid information' do
    prev_count = User.count

    visit root_path
    click_link 'Sign Up'

    click_button 'Sign Up'

    expect( User.count ).to eql( prev_count )

    page.should_not have_content('Welcome!')
    page.should_not have_content('Sign Out')

    page.should have_content('Sign Up')
    page.should have_content('Sign In')
    page.should have_content("can't be blank")

   end
end