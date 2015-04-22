Feature: User joins group and sees notification
	As a user 
	When i join a group
	I want a notification to know i'm in a group

Scenario: User joins group
	Given I am a user
	When I join a group
	Then I should see “You have joined a group!”
