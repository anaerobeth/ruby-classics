FactoryGirl.define do

  factory :user do
    first_name 'Dave'
    last_name  'Thomas'
    sequence(:user_name) {|n| "#{n}Rubyist" }
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'davepassword'


    factory :user_with_reviews do
      after(:create) do |user|
        posting = FactoryGirl.create(:posting, user: user)
        FactoryGirl.create_list(:review, 5, user: user, posting: posting)
      end
    end

    factory :user_with_postings do
      after(:create) do |user|
        FactoryGirl.create(:posting, user: user)
      end
    end


  end

  factory :posting do
    user
    sequence(:title) {|n| "#{n}Learn to Program"}
    sequence(:url) {|n| "http://www.pragprog#{n}.com"}
    category 'Book'
    description 'An awesome programming book'

    factory :posting_with_reviews do
      after(:create) do |posting|

        FactoryGirl.create_list(:review, 5, posting: posting)
      end
    end


  end

  factory :review do
    sequence(:body) { |n| "#{n}Highly recommended"}
  end


end