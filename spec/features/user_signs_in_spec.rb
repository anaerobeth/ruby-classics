require 'spec_helper'

feature 'user signs in',%Q{
  As a Ruby developer
  I want sign in to my account
  So that I can comment and rate a resource item
} do

# ACCEPTANCE CRITERIA
#
# I must specify user name and password
# If I don't specify the required information I am shown an error and promted to re-enter the infermation
# If I am successful, I am greeted with a message, logged in, and brought to the home page

  scenario 'with valid information' do
    visit root_path
    click_link 'Sign In'

    fill_in 'User Name', with: 'Rubyist'
    fill_in 'user_password', with: 'ellapw'

    click_button 'Sign In'

    page.should have_content('Welcome!')
    page.should have_content('Sign Out')

    page.should_not have_content('Sign In')

  end

  scenario 'with invalid information' do
    visit root_path
    click_link 'Sign In'

    click_button 'Sign Up'

    expect( User.count ).to eql( prev_count )

    page.should_not have_content('Welcome!')
    page.should_not have_content('Sign Out')

    page.should have_content('Sign Up')
    page.should have_content('Sign In')
    page.should have_content("can't be blank")

   end
end