require 'spec_helper'

feature 'user views postings' do

  scenario 'all of the postings are listed' do

    FactoryGirl.create_list(:user_with_postings, 5)

    visit postings_path

    Posting.all.each do |posting|
      expect(page).to have_content( posting.title )
    end

  end

  scenario 'pagination setting lists 5 at a time' do
    FactoryGirl.create_list(:user_with_postings, 10)

    visit postings_path
    expect(page).to have_content('Next')
    expect(page).to have_content('Last')

    expect(page).to have_content(Posting.first.title)
    expect(page).to_not have_content(Posting.last.title)

    click_link 'Last'
    expect(page).to have_content('First')
    expect(page).to have_content('Prev')

    expect(page).to have_content(Posting.last.title)
    expect(page).to_not have_content(Posting.first.title)
  end

end