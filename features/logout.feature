Feature: log out from the LEP website
 
  As a LEP user
  So that I protect my information
  I want to be able to log out of my account

Background: Two users are in the database
  Given the following users exist:
    | id | first_name | email                  | admin | first_lang_preference |
    | 1  | existing   | existing@berkeley.edu  | false | english               |
    | 2  | admin      | admin@berkeley.edu     | true  | english               |

Scenario: log out as a normal user
  Given I am an existing user
  And I sign in
  Then I should see "LOGOUT"
  When I follow "LOGOUT"
  Then I should not see "Language Exchange Program"

Scenario: log out as an admin
  Given I am an admin user
  And I sign in
  Then I should see "LOGOUT"
  When I follow "LOGOUT"
  Then I should not see "Language Exchange Program"
