Feature: log in from the LEP website
 
  As a LEP user
  So that I can use the language exchange program
  I want to be able to log into  my account

Scenario: Prompts user to login if not logged in
  Given I am not authenticated
  And I am on the LEP homepage
  When I press login 
  Then I should see the Calnet Authentication page

Scenario: Redirects non-admin user to homepage when successfully authenticated
  Given I am not an admin
  And I am authenticated
  When I go to the LEP page
  Then I should be at the LEP student home page

Scenario: Redirects admin user to homepage when successfully authenticated
  Given I am an admin
  And I am authenticated
  When I go to the LEP page
  Then I should be at the LEP admin home page
