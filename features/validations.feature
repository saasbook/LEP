Feature:
	As a student
	I should not be able to submit blank form entries
	So that the application is always accurate

Scenario: 
	Given I am on the form page
	And I fill in "First Name" with ""
	When I press "Submit"
	Then I should see "First name can't be blank"

Scenario: 
	Given I am on the form page
	And I fill in "Student ID Number" with "12456"
	When I press "Submit"
	Then I should see "Sid must be 8 characters"
