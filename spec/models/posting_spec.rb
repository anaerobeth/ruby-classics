require 'spec_helper'

describe Posting do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:category) }
  it { should have_valid(:category).when( 'Book', 'Video', 'Article') }
  it { should_not have_valid(:category).when( 'bananas', 1) }
  it { should validate_presence_of(:description) }
  it { should belong_to(:user) }
  it { should have_many(:reviews) }
  it { should have_many(:recommendations) }
end
