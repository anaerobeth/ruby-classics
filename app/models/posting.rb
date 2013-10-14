class Posting < ActiveRecord::Base

  belongs_to :user,
    inverse_of: :postings

  has_many :reviews,
    inverse_of: :posting

  has_many :recommendations,
    inverse_of: :posting

  validates_presence_of :title
  validates_presence_of :url
  validates_format_of :url,
    with: URI::regexp(%w(http https))

  validates_presence_of :category
  validates_inclusion_of :category,
    in: ['Book', 'Video', 'Article']
  validates_presence_of :description

end
