Feature: Student Requests Courses
  As a student
  I want to request courses not offered

  @wip
    Scenario: Users who aren't students shouldn't see course request link
      Given I am a guest user
      When I go to the home page
      Then I should not see "Request Courses"

    Scenario: New Request
      Given I am logged in as a student
      And there is a course with identifier COT3100
      And there is a course with identifier COP3503
      And there is a course with identifier CNT4504
      When I go to the home page
      Then I should see "Request Courses"
      When I follow "Request Courses"
      And I select "Fall" from "Semester"
      And I select "2012" from "Year"
      And I select "COT3100" from "course_request_course_request_courses_attributes_0_course_id"
      And I select "Evening" from "course_request_course_request_courses_attributes_0_time"
      And I choose "course_request_course_request_courses_attributes_0_rank_1"
      And I select "COP3503" from "course_request_course_request_courses_attributes_1_course_id"
      And I select "Morning" from "course_request_course_request_courses_attributes_1_time"
      And I choose "course_request_course_request_courses_attributes_1_rank_2"
      And I select "CNT4504" from "course_request_course_request_courses_attributes_2_course_id"
      And I select "Morning" from "course_request_course_request_courses_attributes_2_time"
      And I choose "course_request_course_request_courses_attributes_2_rank_3"
      When I press "Request Courses"
      Then I should see "Request submitted"
      And I should see "COT3100"
      And I should see "COP3503"
      And I should see "CNT4504"

    Scenario: List requests
      Given I am logged in as a student
      And there is a course with identifier COT3100
      And n12345678 has requested COT3100 in the morning for Fall 2012
      When I go to the home page
      And I follow "My Requests"
      Then I should see "COT3100"
      And I should see "Morning"
      And I should see "Fall"
      And I should see "2012"

    Scenario: Edit past request
      Given I am logged in as a student
      And there is a course with identifier COT3100
      And n12345678 has requested COT3100 in the morning for Fall 2012
      When I go to the home page
      And I follow "My Requests"
      And I follow "Edit"
      And I select "Evening" from "course_request_course_request_courses_attributes_0_time"
      And I press "Request Courses"
      Then I should see "Evening"

