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


  scenario 'user provides the required information' do
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
    click_on 'Review this'

    fill_in :review_body, with: 'Very useful!'

    click_on 'Create Review'

    expect(Review.count).to eql(total_count + 1)
    new_user_reviews_count = Review.where('user_id = ?', user.id).count
    expect(new_user_reviews_count).to eql( prev_user_reviews_count + 1 )
    expect(page).to have_content('Thank you for your review.')

    expect(page).to have_content(posting.title)

  end

  # describe 'user does not provide the required information' do
  #   scenario 'User provides no information' do

  #     user = FactoryGirl.create(:user)
  #     posting = FactoryGirl.create(:food_posting)

  #     prev_count = Review.count
  #     visit new_user_session_path
  #     fill_in 'Email', with: user.email
  #     fill_in 'Password', with: user.password
  #     click_button 'Sign In'

  #     visit new_food_posting_review_path(posting)

  #     click_on 'Create Review'

  #     expect(Review.count).to eql(prev_count)
  #     expect(page).to have_content("can't be blank")

  #   end
  #   scenario 'User provides body, but no is_good' do

  #     user = FactoryGirl.create(:user)
  #     posting = FactoryGirl.create(:food_posting)

  #     prev_count = Review.count
  #     visit new_user_session_path
  #     fill_in 'Email', with: user.email
  #     fill_in 'Password', with: user.password
  #     click_button 'Sign In'

  #     visit new_food_posting_review_path(posting)

  #     fill_in 'Body', with: 'SOOOOO GOOOD'

  #     click_on 'Create Review'

  #     expect(Review.count).to eql(prev_count)
  #     expect(page).to have_content("must be filled")

  #   end
  # end
  # scenario 'User cancels making a review' do
  #   posting = FactoryGirl.create(:food_posting)

  #   visit_posting_reviews_path(posting)
  #   click_on 'Add review'
  #   click_on 'Cancel'

  #   expect(page).to have_content(posting.name)
  # end



end