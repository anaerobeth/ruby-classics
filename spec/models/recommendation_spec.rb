require 'spec_helper'

describe Recommendation do
  it { should belong_to(:user) }
  it { should belong_to(:posting) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:posting) }

end
