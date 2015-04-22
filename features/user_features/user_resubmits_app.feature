Feature: User resubmits app
	As a user
	When i resubmit my app
	if i am in an existing group/pair 
	and i have changed my language preferences
	then i should be removed from these groups/pairs

Scenario: User resubmits app
	Given I am a user 
	When I resubmit my application
	And I have different language preferences
	Then I should be removed from previously assigned groups