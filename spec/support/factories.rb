FactoryGirl.define do

  factory :user do
    first_name 'Dave'
    last_name  'Thomas'
    sequence(:user_name) {|n| "Rubyist#{n}" }
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'davepassword'
  end

  factory :posting do
    user
    sequence(:title) {|n| "Learn to Program#{n}"}
    sequence(:url) {|n| "http://www.pragprog#{n}.com"}
    category 'Book'
    description 'An awesome programming book'
  end


end