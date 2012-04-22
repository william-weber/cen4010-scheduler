require "spec_helper"

describe FacultyCourseRequestsController do
  describe "routing" do

    it "routes to #index" do
      get("/faculty_course_requests").should route_to("faculty_course_requests#index")
    end

    it "routes to #new" do
      get("/faculty_course_requests/new").should route_to("faculty_course_requests#new")
    end

    it "routes to #show" do
      get("/faculty_course_requests/1").should route_to("faculty_course_requests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/faculty_course_requests/1/edit").should route_to("faculty_course_requests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/faculty_course_requests").should route_to("faculty_course_requests#create")
    end

    it "routes to #update" do
      put("/faculty_course_requests/1").should route_to("faculty_course_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/faculty_course_requests/1").should route_to("faculty_course_requests#destroy", :id => "1")
    end

  end
end
