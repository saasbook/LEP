Feature: Admin has all the options next to user

  As an admin
	I want to be able to show/delete etc. the user 
	so I should have links to these options

Background: Two users are in the database
  Given the following users exist:
    | id | first_name | email                  | admin | first_lang_preference |
    | 1  | existing   | existing@berkeley.edu  | false | english               |
    | 2  | admin      | admin@berkeley.edu     | true  | english               |
  And I am an admin user
  And I sign in

Scenario: Admin goes to user index page 
	Given I am on the users index page
	Then I should see "Deactivate"
  Then I should see "Grant Admin"
