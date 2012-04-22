Feature: Faculty Requests Courses
  As a faculty member
  I want to request to teach courses

    Scenario: Users who aren't faculty shouldn't see course request link
      Given I am a guest user
      When I go to the home page
      Then I should not see "Request to teach courses"

    Scenario: New Request
      Given I am logged in as a faculty
      And there is a course with identifier COT3100
      And there is a course with identifier COP3503
      And there is a course with identifier CNT4504
      When I go to the home page
      Then I should see "Request to teach courses"
      When I follow "Request to teach courses"
      And I select "Fall" from "Semester"
      And I select "2012" from "Year"
      And I check "Course Release"
      And I select "1" from "Course Preference"
      And I select "2" from "Days of Week"
      And I select "3" from "Times of Day"
      And I select "COT3100" from "course_request_course_request_courses_attributes_0_course_id"
      And I choose "course_request_course_request_courses_attributes_0_rank_1"
      And I select "COP3503" from "course_request_course_request_courses_attributes_1_course_id"
      And I choose "course_request_course_request_courses_attributes_1_rank_2"
      And I select "CNT4504" from "course_request_course_request_courses_attributes_2_course_id"
      And I choose "course_request_course_request_courses_attributes_2_rank_3"
      And I select "1" from "Morning"
      And I select "2" from "Afternoon"
      And I select "3" from "Evening"
      And I select "1" from "MWF 3 Credits"
      And I select "2" from "MWF"
      And I select "3" from "TR"
      When I press "Submit Request"
      Then I should see "Request submitted"
      And I should see "COT3100"
      And I should see "COP3503"
      And I should see "CNT4504"

    Scenario: List requests
      Given I am logged in as a faculty
      And there is a course with identifier COT3100
      And n12345678 has a course request for Fall 2010
      When I go to the home page
      And I follow "My Requests"
      Then I should see "COT3100"
      And I should see "Morning"
      And I should see "Fall"
      And I should see "2012"

    Scenario: Edit past request
      Given I am logged in as a faculty
      And there is a course with identifier COT3100
      And n12345678 has a course request for Fall 2012
      When I go to the home page
      And I follow "My Requests"
      And I follow "Edit"
      And I select "Evening" from "course_request_course_request_courses_attributes_0_time"
      And I press "Request Courses"
      Then I should see "Evening"

