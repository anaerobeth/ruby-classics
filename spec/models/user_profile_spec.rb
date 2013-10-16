require 'spec_helper'

describe UserProfile do
  it { should belong_to(:user) }
  it { should have_valid(:user) }
end
