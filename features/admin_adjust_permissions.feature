Feature: Adjust permissions for users
  As an administrator
  I want to make other users administrators or delete administrators
  In order to set the right permissions

Background: admin has been added to database
  Given the following users exist:
  | first_name     | admin |
  |  aladdin       | false |
  |   Admin        | true  |
  And I am an admin user
  And I sign in
  And I am on the admin home page

Scenario: Make another user an admin
  Given I am on the all users page 
  When I click “make admin” for a user
  Then that user should be an admin

Scenario: Set an admin user to a non-admin user
  Given I am on the all users page 
  When I click “delete admin permissions” for a user
  Then that user should be an admin

