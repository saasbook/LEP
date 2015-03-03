Feature: log out from the LEP website
 
  As a LEP user
  So that I protect my information
  I want to be able to log out of my account

Scenario: log out as a normal user
  Given I am not an admin
  And I am authenticated
  And I am on the LEP student home page
  When I press logout
  Then I should be on the logged out page

Scenario: log out as an admin
  Given I am an admin
  And I am authenticated
  And I am on the LEP admin home page
  When I press logout
  Then I should be on the logged out page
