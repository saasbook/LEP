Feature: Adjust permissions for users
  As an administrator
  I want to make other users administrators or delete administrators
  In order to set the right permissions

Background: admin has been added to database
  Given the following users exist:
  | id | first_name    | admin | active | email                 |
  | 1  | aladdin       | false | true   | active@berkeley.edu   |
  | 2  |  admin        | true  | true   | admin@berkeley.edu    |
  | 3  | jasmine       | true  | true   | inactive@berkeley.edu |

  And I am an admin user
  And I sign in

Scenario: Make another user an admin
  Given I am an admin user
  And I am on the users index page
  When I make aladdin as an admin
  Then that user should be an admin

Scenario: Set an admin user to a non-admin user
  Given I am an admin user
  And I am on the users index page
  When I remove jasmine as an admin
  Then that user should not be an admin
