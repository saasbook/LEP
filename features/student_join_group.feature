Feature: Join group
  In order to learn languages
  As a student user
  I want to be able to join a language group

Scenario: Join a group
  Given I am on the form page
  And I have filled out the form
  And I should see "Language Groups"
  When I press "Submit"
  Then I should belong to a group

Scenario:
  Given I am on the form page
  And I have filled out the form
  And I should see "Lead a group"
  When I press "Submit"
  Then I should be leading a group
