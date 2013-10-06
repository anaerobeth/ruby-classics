require 'spec_helper'

feature 'creates a posting', %Q{
  As an authenticated user
  I want to create and add a resource item to a category
  So that I can share useful resources to the Ruby community
  } do

  # Acceptance Criteria:
  # I must give a title, category and url
  # If I don't, I get an error notification and I am prompted to re-enter the required information

  scenario "creates a posting using valid information" do
    prev_posting_count = Posting.count
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    posting = FactoryGirl.create(:posting)
    visit new_posting_path
    save_and_open_page
    fill_in "Title", with: posting.title
    fill_in "Website", with: posting.url
    select "Category", with: posting.category
    fill_in "Description", with: posting.description

    click_button 'Create a post'
    expect(Posting.count).to eql(prev_posting_count + 1)
    expect(page).to have_content('You have successfully added a book')
  end

end