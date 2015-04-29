Feature: Admin creates user pair
	As an admin
	I want to be able to create a new user pair 
	So i should have a create new pair option

Scenario: Admin creates pair
		Given I am an admin user
		When I am on the pairing page
		Then I should see Create New Pair
