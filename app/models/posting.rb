class Posting < ActiveRecord::Base

  validates_presence_of :title
  validates_presence_of :url
  validates_format_of :url,
    with: URI::regexp(%w(http https))

  validates_presence_of :category
  validates_inclusion_of :category,
    in: ['Book', 'Video', 'Article']
  validates_presence_of :description

  belongs_to :user,
    inverse_of: :postings
end
