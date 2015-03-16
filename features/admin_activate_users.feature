Feature: Activate/ Deactivate Students
  As an administrator
  I want to deactivate or activate students
  In order to track who is currently participating in the program and to store information about inactive students

Background: admin has been added to database
  Given the following users exist:
  | first_name     | admin |
  |  aladdin       | false |
  |   Admin        | true  |
  And I am an admin user
  And I sign in
  And I am on the admin home page

Scenario: Activate a user
  Given I am on the all users page
  When I deactivate an active student
  Then the student should be deactivated

Scenario: Deactivate users
  Given I am on the all users page
  When I activate a deactivated student
  Then the student should be activated
