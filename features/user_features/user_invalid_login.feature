Feature: User logs in with non berkeley email
	As a user 
	If i login with my non berkeley email
	then i need a logout button

Scenario: User logs in without berkeley email
	Given I am a user
	When I login with xx@gmail.com
	Then I should be on the invalid page
	Then I should see logout
