class UserProfile < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :user_profile

  validates_format_of :blog,
    with: URI::regexp(%w(http https))

  validates_format_of :website,
    with: URI::regexp(%w(http https))

end
