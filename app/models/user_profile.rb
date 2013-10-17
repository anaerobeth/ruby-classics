class UserProfile < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :user_profile
end
