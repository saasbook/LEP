Feature:
	As a student
	I should not be able to submit invalid form entries
	So that the application is always accurate

Scenario: 
	Given I am on the form page
	And I fill in "First Name" with ""
	When I press "Submit"
	Then I should see "First name can't be blank"

Scenario: 
	Given I am on the form page
	And I fill in "First Name" with "Tom"
	And I fill in "Last Name" with ""
	When I press "Submit"
	Then I should see "Last name can't be blank"

Scenario: 
	Given I am on the form page
	And I fill in "Student ID Number" with "12456"
	When I press "Submit"
	Then I should see "Sid must be 8 characters"

Scenario: 
	Given I am on the form page
	And I fill in "Student ID Number" with "2948573a"
	When I press "Submit"
	Then I should see "Sid only allows numbers"

Scenario: 
	Given I am on the form page
	And I fill in "Berkeley Email" with ""
	When I press "Submit"
	Then I should see "Email can't be blank"

Scenario: 
	Given I am on the form page
	And I fill in "Major(s)" with ""
	When I press "Submit"
	Then I should see "Major can't be blank"
