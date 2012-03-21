require 'spec_helper'

describe User do
  subject { Factory(:user) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:n_number) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_uniqueness_of(:n_number) }
  it { should validate_uniqueness_of(:email) }
  it { should belong_to(:degree_program) }

  it "should factory" do
    user = Factory :user
    assert user.valid?
  end
end
