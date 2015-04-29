Feature: As an admin,
    I should be able to view and edit timesheets
    so that I can observe users' participations 

Background: One user is in the database
  Given the following users exist:
  | id | first_name | email                  | admin | first_lang_preference |
  | 1  | existing   | existing@berkeley.edu  | false | english               |
  | 2  | admin      | admin@berkeley.edu     | true  |                           |

  And the following timesheets exist:
  | id | user_id | language   | hours | date           |
  | 1  | 1       | Chinese    | 2     | 02/02/2015     |
  And I am an admin user
  And I sign in

Scenario: Viewing a student's timesheets 
    Given I am on the admin timesheet home page
    When I follow "View Timesheets"
    Then I should see "Chinese"

