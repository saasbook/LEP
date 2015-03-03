Feature: log out from the LEP website
 
  As a LEP user
  So that I protect my information
  I want to be able to log out of my account

Scenario: log out as a normal user
  Given I am logged in as a user
  And I am on the LEP homepage
  When I press logout
  Then I should be on the logged out page

Scenario: log out as an admin
  Given I am logged in as an admin
  And I am on the LEP homepage
  When I press logout
  Then I should be on the logged out page
