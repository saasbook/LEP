Feature: Viewing information about Groups
  As an administrator
  I want to look at information about groups
  In order to contact people or check group pairings    

Background: admin has been added to database
  Given the following users exist:
  | first_name     | admin |
  |   Admin        | true  |
  |  aladdin       | false |

  Given the following groups exist:
  |   members    |   languages    |
  |    a, b      |    eng, esp    |
  |    c, d      |    fra, ger    |

Scenario: View all groups
  Given I am an admin
  When I am on the admin home page
  When I press “Show groups”
  Then I should see all groups

Scenario: View all users
  Given I am an admin
  When I am on the admin home page
  When I press "Show users"
  Then I should see all users

#Scenario: Searching for a group
#Given I am an admin 
#  And I am on the view groups page
#  When I filter for a group
#  Then I should see p

#Scenario: Looking for a person’s contact info
#  Given I am an admin
#  And I am viewing a certain group
#  Then I should see names of the group members
#  When I click on a person’s name
#  Then I should see the person’s email
