require 'spec_helper'

feature 'user creates a posting', %Q{
  As an authenticated user
  I want to create and add a resource item to the database
  So that I can share useful resources to the Ruby community
  } do

  # Acceptance Criteria:
  # I must give a title, category and url
  # If I don't, I get an error notification and I am prompted to re-enter the required information

  scenario 'creates a posting using valid information' do

    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    posting = FactoryGirl.create(:posting)
    prev_posting_count = Posting.count
    visit new_posting_path

    fill_in "Title", with: posting.title
    fill_in "Website", with: posting.url
    fill_in "Description", with: posting.description
    select 'Book'

    click_button 'Add this resource'
    expect(Posting.count).to eql(prev_posting_count + 1)
    expect(page).to have_content('Your post has been added to Ruby Classics.')
  end

  scenario 'fails to create a posting using invalid information' do

    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    posting = FactoryGirl.create(:posting)
    prev_posting_count = Posting.count
    visit new_posting_path

    click_button 'Add this resource'
    expect(Posting.count).to eql(prev_posting_count)
    expect(page).to_not have_content('Your post has been added to Ruby Classics.')
    expect(page).to have_content("can't be blank")
  end

  scenario 'cancels making a posting' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    posting = FactoryGirl.create(:posting)
    prev_posting_count = Posting.count
    visit new_posting_path

    click_on 'Cancel'
    expect(Posting.count).to eql(prev_posting_count)
    expect(page).to_not have_content('Your post has been added to Ruby Classics')

    expect(page).to have_content("The best online resources for Ruby developers")
  end


end