Feature: Admin Set Application Deadline
	As an admin
	So that students can be placed in pairs
	I want to set a deadline for application submissions

Scenario:
	Given that I am an admin home page
	When I enter “May 15, 2015”
	And I press “Set Application Deadline”
	Then I should see “Application Deadline Successfully Changed”
	And I should see “Application Deadline: May 15, 2015”
