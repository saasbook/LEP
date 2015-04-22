Feature:
	As a student
	I should not be able to submit blank form entries
	So that the application is always accurate

Scenario: 
	Given I am on the form page
	And I do not fill out the first_name field
	When I press "submit"
	Then I should see “Please provide entries for all required fields.”
