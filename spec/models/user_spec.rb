require 'spec_helper'

describe User do
  it { should validate_presence_of(:user_name) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should have_many(:postings) }
  it { should have_many(:recommendations) }
  it { should have_one(:user_profile) }

end
