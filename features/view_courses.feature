Feature: View available courses
  As a visitor of the website
  I want to view the courses offered in a given semester

    Scenario: Logged in student can see courses and link to student request form
      Given I am logged in as a student
      When I edit my account details
      Then I should see an account edited message

    Scenario: Logged in faculty can see courses and link to faculty request form

    Scenario: Guest user can see courses for current semester
      Given I am a guest user
      And there is a course named "Example Course" that is offered this semester
      When I go to the course listing page
      Then I should see "Example Course" on the page

@wip
    Scenario: Guest user can see courses for current semester
      Given I am a guest user
      And there is a course named "Example Course" that is offered this semester
      And there is a course named "Other Course" that is offered in the fall of even years
      When I go to the course listing page
      And I select "Fall" from "semester"
      And I select "2014" from "year"
      Then I press "View"
      Then I should see "Example Course" on the page
      Then I should see "Other Course" on the page

