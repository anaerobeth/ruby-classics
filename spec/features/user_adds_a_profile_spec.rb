require 'spec_helper'

feature 'user creates a profile', %Q{
  As an authenticated user
  I want to create my profile
  So that I can connect with others in the Ruby community
  } do

  # Acceptance Criteria:
  # I can provide a description of myself
  # I can optionally specify my hometown, twitter account,
  #   github link, blog, website


  scenario 'creates a user_profile' do

    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    user_profile = FactoryGirl.create(:user_profile)
    prev_profile_count = UserProfile.count
    visit new_user_profile_path

    fill_in "Hometown", with: user_profile.hometown
    fill_in "About me", with: user_profile.about_me
    fill_in "Twitter", with: user_profile.twitter
    fill_in "Github", with: user_profile.github
    fill_in "Blog", with: user_profile.blog
    fill_in "Website", with: user_profile.website

    click_button 'Create my profile'
    expect(UserProfile.count).to eql(prev_profile_count + 1)
    expect(page).to have_content('Wow, your profile page looks great.')
  end
end
