class PostingVote < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :posting_votes

  belongs_to :posting,
    inverse_of: :posting_votes

  validates_presence_of :user
  validates_presence_of :posting

  validates_uniqueness_of :posting_id,
    scope: :user_id
  validates_inclusion_of :value, in: [1, -1]

end
