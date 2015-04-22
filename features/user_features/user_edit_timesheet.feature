Feature: As a student,
    I want to be able to edit my timesheet 
    so that I can make changes or fix mistakes

Background: 
    Given the following users exist:
    | id | first_name | email                 | admin |
    | 1  | Billy      | billy@berkeley.edu    | false |
    
    Given the following timesheets exist:
    | id | user_id | date | start_time | end_time |
    | 1  | 1       | 3/30 |     9PM    |    10PM  |

Scenario:
    Given I am logged in as Billy
    And I am on the timesheet edit page
    When I update start time to 8PM
    And I press save
    Then I should be on the user show page
    And I should see 8PM

