class Recommendation < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :recommendations
  belongs_to :posting,
    inverse_of: :recommendations

  validates_presence_of :user
  validates_presence_of :posting

  validates_uniqueness_of :posting_id,
  scope: :user_id
end
