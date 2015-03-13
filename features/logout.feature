Feature: log out from the LEP website
 
  As a LEP user
  So that I protect my information
  I want to be able to log out of my account

Scenario: log out as a normal user
  Given I am an existing user
  And I sign in
  Then I should see "Logout"
  When I follow "Logout"
  Then I should not see "Language Exchange Program"

Scenario: log out as an admin
  Given I am an admin user
  And I sign in
  Then I should see "Logout"
  When I follow "Logout"
  Then I should not see "Language Exchange Program"
