Feature: Viewing information about Groups
  As an administrator
  I want to look at information about groups
  In order to contact people or check group pairings    

Scenario: View all groups
  Given I am an admin
  And I am on the admin home page
  When I click “View All Groups”
  Then I should see “Paired Groups”
  And I should not see “Click to Pair”

Scenario: Searching for a group
  Given I am an admin 
  And I am on the view groups page
  When I filter for a group
  Then I should see information about the members in that group

Scenario: Looking for a person’s contact info
  Given I am an admin
  And I am viewing a certain group
  Then I should see names of the group members
  When I click on a person’s name
  Then I should see the person’s email
