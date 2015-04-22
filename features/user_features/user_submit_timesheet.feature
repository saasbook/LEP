Feature: Submit Timesheet Form
    In order to record my hours
    As a student user
    I want to be able to submit an timesheet form

Scenario: 
  Given I am on the new timesheet form page
  And I have filled out the form
  When I press submit
  Then I should see a page confirming my application 
  And I should see the new entry

