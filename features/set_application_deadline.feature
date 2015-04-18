Feature: Admin Set Application Deadline
	As an admin
	So that students can be placed in pairs
	I want to set a deadline for application submissions

Background: admin in database
  Given the following users exist:
  | id | first_name    | admin | active | email                 |
  | 1  | aladdin       | false | false  | active@berkeley.edu   |
  | 2  |  admin        | true  | true   | admin@berkeley.edu    |
  | 3  | jasmine       | false | true   | inactive@berkeley.edu |

  And I am an admin user
  And I sign in

Scenario: Admin wants to set deadline
	Given I am on the admin show page
	When I set the deadline to "05/15/2015"
	And I click "Submit"
	#And I should see "Application Deadline: 05/15/2015"