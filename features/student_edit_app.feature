Feature: Student Edit Application
	As a student
	So that I can make changes or fix mistakes
	I want to be able to edit my application before the deadline

Background: 
	Given the following users exist:
	| id | 			first_name | 				email       | admin |
	| 1  | 				Billy 	 | billy@berkeley.edu | false |

Scenario:
	Given I am logged in as Billy
	And I am on the user edit page
	And the application deadline has not passed
	When I update email to billyjoe@berkeley.edu
	And I press "submit"
	Then I should be on the user show page
	And I should see “billyjoe@berkeley.edu”