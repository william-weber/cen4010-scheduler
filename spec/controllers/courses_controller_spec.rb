require 'spec_helper'

describe CoursesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "with no params, assigns list of courses for current semester" do
      courses = []
      courses << Factory( :course, :offering_pattern => 1 )
      Factory( :course, :offering_pattern => 2 )
      courses << Factory( :course, :offering_pattern => 1 )
      get 'index'
      assigns(:courses).should =~ courses
    end
  end

end
