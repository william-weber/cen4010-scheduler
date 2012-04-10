Feature: Student log in
  In order to record my course preferences and see available courses
  A user
  Should be able to log in

    Scenario: Student is not signed up
      Given I am a guest user
      When I sign in with valid student credentials
      Then I see an invalid login message
      And I should be signed out

    Scenario: Student signs in
      Given I exist as a student
      And I am not logged in
      When I sign in with valid student credentials
      Then I see a successful sign in message
      When I return to the site
      Then I should be signed in

    Scenario: Student enters wrong n number
      Given I exist as a student
      And I am not logged in
      When I sign in with an invalid n number
      Then I see an invalid login message
      And I should be signed out
      
    Scenario: Student enters wrong password
      Given I exist as a student
      And I am not logged in
      When I sign in with a wrong password
      Then I see an invalid login message
      And I should be signed out

      
