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

Scenario: Deleted timesheet should not show up
    Given I am on the timesheet home page
    When I follow "Delete"
    Then I should not see "Chinese"


