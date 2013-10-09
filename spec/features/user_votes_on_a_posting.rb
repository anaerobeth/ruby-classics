require 'spec_helper'

feature 'user votes on a posting', %Q{
  As a authenticated user
  I want to vote on a posting
  So that I can share my opinion to others
  } do

  # Acceptance Criteria
  # I can only upvote or downvote once
  # I can change my vote from up to down
  # I can see that I voted

  scenario 'user upvotes' do
    user = FactoryGirl.create(:user)
    posting = FactoryGirl.create(:posting, user_id: user.id )

    prev_count = PostingVote.count


    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit postings_path(posting)
    click_link 'Up'
    click_button "Create Vote"

    expect(PostingVote.count).to eql(prev_count + 1)
    expect(page).to have_content("You voted successfully")
    expect(PostingVote.last.value).to eql(1)

    expect(PostingVote.last.user_id).to eql(user.id)
    expect(PostingVote.last.posting_id).to eql(posting.id)

  end

  # scenario 'user downvotes' do
  #   user = FactoryGirl.create(:user)
  #   posting = FactoryGirl.create(:posting, user_id: user.id )

  #   prev_count = PostingVote.count


  #   visit new_user_session_path
  #   fill_in 'Email', with: user.email
  #   fill_in 'Password', with: user.password
  #   click_button 'Sign In'

  #   visit postings_path(posting)
  #   click_link 'Up'
  #   click_button "Create Vote"

  #   expect(PostingVote.count).to eql(prev_count + 1)
  #   expect(page).to have_content("You voted successfully")
  #   expect(PostingVote.last.value).to eql(-1)

  #   expect(PostingVote.last.user_id).to eql(user.id)
  #   expect(PostingVote.last.posting_id).to eql(posting.id)
  # end
end