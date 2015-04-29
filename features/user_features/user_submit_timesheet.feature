Feature: Submit Timesheet Form
    In order to record my hours
    As a student user
    I want to be able to submit an timesheet form

Background: One user is in the database
  Given the following users exist:
  | id | first_name | email                  | admin | first_lang_preference |
  | 1  | existing   | existing@berkeley.edu  | false | english                   |
  And I am an existing user
  And I sign in

Scenario: We should see the new timesheet entry
  Given I am on the new timesheet page
  And I select "English" from "language"
  And I set the date to "04/04/2015"
  And I fill in "hours" with "2"
  When I press submit for the form
  Then I should see "English"

Scenario: We should see an error if we don't select a language
  Given I am on the new timesheet page
  And I set the date to "04/04/2015"
  And I fill in "hours" with "2"
  When I press submit for the form
  Then I should see "New Timesheet"

Scenario: We should see an error if we don't enter a valid hour
  Given I am on the new timesheet page
  And I select "English" from "language"
  And I set the date to "04/04/2015"
  And I fill in "hours" with "25"
  When I press submit for the form
  Then I should see "New Timesheet"
