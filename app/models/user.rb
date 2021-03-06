class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :postings,
    inverse_of: :user

  has_many :reviews,
    through: :postings,
    inverse_of: :user

  has_many :recommendations,
    inverse_of: :user

  has_one :user_profile,
    inverse_of: :user

  validates_presence_of :user_name
  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_uniqueness_of :user_name, :case_sensitive => false, :message => "has already been taken"
  validates_uniqueness_of :email, :case_sensitive => false, :message => "has already been taken"

  def full_name
    "#{first_name} #{last_name}"
  end

end
