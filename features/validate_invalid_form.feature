Feature:
	As a student
	I should not be able to submit invalid form entries
	So that the application is always accurate

Scenario: 
	Given I am on the form page
	And I enter “12456” for the sid field
	When I press "submit"
	Then I should see “Invalid SID.”