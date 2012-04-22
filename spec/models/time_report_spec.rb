require 'spec_helper'

describe TimeReport do
  it { should validate_presence_of(:time) }
end
