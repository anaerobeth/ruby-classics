class Review < ActiveRecord::Base
  validates_presence_of :posting
  validates_presence_of :body
  validates_presence_of :user

  belongs_to :posting,
    inverse_of: :reviews,
    dependent: :destroy

  belongs_to :user,
    inverse_of: :reviews
end
