Feature: Student user can deactivate or activate their profile

  As a student user
  So that I can participate in LEP in different semesters
  I want to the ability to activate and deactivate my profile
  
Background: student has a profile

Scenario: student activates/deactivates
  Given I am a student user
  And I am on user show page
  When I press “Deactivate”
  Then I should see "Your profile is now deactivated"
  When I press “Activate” 
  Then I should see "Your profile is now deactivated"







