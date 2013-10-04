FactoryGirl.define do

  factory :user do
    first_name 'Dave'
    last_name  'Thomas'
    user_name  'Rubyist'
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'davepassword'
  end

end