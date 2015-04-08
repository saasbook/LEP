Feature: As an admin,
  I want to be able to edit language groups
  So that I can make changes to the schedule or fix mistakes 

Background: admin in database
  Given the following users exist:
  | id | first_name | admin | active | 
  | 1  | admin      | true  | true   |

  And I am an admin user
  And I sign in

Scenario: Admin wants to edit group
  Given I am on the groups page
  When I press "edit"
  Then I should be on the edit group page
  When I press "save"
  Then I should be on the groups page
