Feature: As an admin,
  I want to be able to edit language groups
  So that I can make changes to the schedule or fix mistakes 

Background: admin in database
  Given the following users exist:
  | id | first_name | email                  | admin | first_lang_preference | active |
  | 1  | existing   | existing@berkeley.edu  | false | english               | true   |
  | 2  | admin      | admin@berkeley.edu     | true  | NA 		               |        |
  And I am an admin user
  And I sign in

Scenario: Admin wants to edit group
  Then Chris says this passes
