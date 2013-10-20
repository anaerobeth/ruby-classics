require 'spec_helper'

feature 'user reviews a posting', %Q{
  As an authenticated user
  I want to review a posting
  So that I an give my opinion about the posting
} do

  # ACCEPTANCE CRITIERA
  #
  # I must provide a text of the review
  # I can see that I have reviewed the posting when I do so


  scenario 'user provides text for Review field' do
    user = FactoryGirl.create(:user)
    posting = FactoryGirl.create(:posting)

    total_count = Review.count
    prev_user_reviews_count = Review.where('user_id = ?', user.id).count

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit postings_path
    click_on 'Reviews'
    click_on 'Be the first to review this'

    fill_in :review_body, with: 'Very useful!'

    click_on 'Create Review'

    expect(Review.count).to eql(total_count + 1)
    new_user_reviews_count = Review.where('user_id = ?', user.id).count
    expect(new_user_reviews_count).to eql( prev_user_reviews_count + 1 )
    expect(page).to have_content('Thank you for your review.')

    expect(page).to have_content(posting.title)

  end

  scenario 'user did not provide text for Review field' do
    user = FactoryGirl.create(:user)
    posting = FactoryGirl.create(:posting)

    total_count = Review.count
    prev_user_reviews_count = Review.where('user_id = ?', user.id).count

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit postings_path
    click_on 'Reviews'
    click_on 'Be the first to review this'

    click_on 'Create Review'

    expect(Review.count).to eql(total_count)
    new_user_reviews_count = Review.where('user_id = ?', user.id).count
    expect(new_user_reviews_count).to eql( prev_user_reviews_count)
    expect(page).to have_content("can't be blank")
  end

  scenario 'user cancels making a review' do
    user = FactoryGirl.create(:user)
    posting = FactoryGirl.create(:posting)

    total_count = Review.count
    prev_user_reviews_count = Review.where('user_id = ?', user.id).count

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit postings_path
    click_on 'Reviews'
    click_on 'Be the first to review this'

    click_on 'Cancel'

    expect(Review.count).to eql(total_count)
    expect(page).to have_content(posting.title)
  end

end