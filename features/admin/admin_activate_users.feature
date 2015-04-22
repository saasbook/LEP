Feature: Activate/ Deactivate Students
  As an administrator
  I want to deactivate or activate students
  In order to track who is currently participating in the program and to store information about inactive students

Background: admin has been added to database
  Given the following users exist:
  | id | first_name    | admin | active | email                 |
  | 1  | aladdin       | false | false  | active@berkeley.edu   |
  | 2  |  admin        | true  | true   | admin@berkeley.edu    |
  | 3  | jasmine       | false | true   | inactive@berkeley.edu |

  And I am an admin user
  And I sign in

Scenario: Activate a user
  Given I am on the admin home page
  When I activate aladdin
  Then that student should be activated

Scenario: Deactivate users
  Given I am on the admin home page
  When I deactivate jasmine
  Then that student should be deactivated
