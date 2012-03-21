require 'spec_helper'

describe DegreeProgram do
  it { should validate_presence_of(:name) }

  it "should factory" do
    dp = Factory :degree_program
    assert dp.valid?
  end
end
