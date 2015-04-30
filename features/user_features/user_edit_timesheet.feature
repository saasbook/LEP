Feature: As a student,
    I want to be able to edit my timesheet 
    so that I can make changes or fix mistakes

Background: One user is in the database
  Given the following users exist:
  | id | first_name | email                  | admin | first_lang_preference |
  | 1  | existing   | existing@berkeley.edu  | false | english               |
  And the following timesheets exist:
  | id | user_id | language   | hours | date           |
  | 1  | 1       | Chinese    | 2     | 02/02/2015     |
  
  And I am an existing user
  And I sign in

Scenario: Website should update an language entry when a user edits the date
    Given I am on the timesheet home page
    And I follow "Edit"
    And I select "Spanish" from "language"
    When I press submit for the form
    Then I should see "Spanish"
    And I should not see "Chinese"

Scenario: Website should update an language entry when a user edits the date 
    Given I am on the timesheet home page
    And I follow "Edit"
    And I set the date to "02/22/2012"
    When I press submit for the form
    And I should not see "02/02/2015"

Scenario: Website should redirect when accessing an invalid edit page
    Given I am on the timesheet home page
    When I am on the invalid timesheet edit page
    And I should see "All Timesheets"

