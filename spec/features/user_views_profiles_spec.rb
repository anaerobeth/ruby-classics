require 'spec_helper'

feature 'user views profiles' do

  scenario 'all of the profiles are listed' do

    FactoryGirl.create_list(:user_profile, 5)

    visit user_profiles_path

    UserProfile.all.each do |profile|
      expect(page).to have_content( profile.about_me )
    end

  end

  scenario 'pagination setting lists 5 at a time' do
    FactoryGirl.create_list(:user_profile, 10)

    visit user_profiles_path
    expect(page).to have_content('Next')
    expect(page).to have_content('Last')

    expect(page).to have_content(UserProfile.first.about_me)
    expect(page).to_not have_content(UserProfile.last.about_me)

    click_link 'Last'
    expect(page).to have_content('First')
    expect(page).to have_content('Prev')

    expect(page).to have_content(UserProfile.last.about_me)
    expect(page).to_not have_content(UserProfile.first.about_me)
  end

end