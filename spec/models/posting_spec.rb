require 'spec_helper'

describe Posting do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:description) }
  it { should belong_to(:user) }
end
