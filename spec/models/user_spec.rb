require 'spec_helper'

describe User do
  subject { FactoryGirl.create(:user) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:n_number) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_uniqueness_of(:n_number) }
  it { should validate_uniqueness_of(:email) }
  it { should belong_to(:degree_program) }

  it "should factory" do
    user = FactoryGirl.create :user
    assert user.valid?
  end
end
