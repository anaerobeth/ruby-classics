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
    title 'Learn to Program'
    url 'http://www.pragprog.com'
    category 'Book'
    description 'An awesome programming book'
  end


end