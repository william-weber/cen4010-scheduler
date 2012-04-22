require 'spec_helper'

describe ReportUser do
  it { should belong_to(:user) }
  it { should belong_to(:report) }
  it { should belong_to(:course) }
end
