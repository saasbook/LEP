Feature: log in from the LEP website
  As a LEP user
  So that I can use the language exchange program
  I want to be able to log into  my account

Background: Two users are in the database
  Given the following users exist:
  | id | first_name | email                  | admin | first_lang_preference |
  | 1  | existing   | existing@berkeley.edu  | false | english                   |
  | 2  | admin      | admin@berkeley.edu     | true  |                           |

Scenario: Redirects non-admin user to homepage when successfully authenticated
  Given I am an existing user
  When I sign in
  Then I should be on the existing user show page

Scenario: Redirects admin user to homepage when successfully authenticated
  Given I am an admin user
  When I sign in
  Then I should be on the admin show page

Scenario: Redirects a new user to the application when successfully authenticated 
  Given I am a non-existing user
  When I sign in
  Then I should be on the new user page 

Scenario: Redirects invalid user to invalid page when successfully authenticated
  Given I am an invalid user
  When I sign in
  Then I should be on the invalid page
