Feature: display language groups for admins

  As an admin
  So that I can see all language groups
  I want to see a list of all language groups 
  
Background: student has been added to a group
  Given the following users exist:
  | first_name | admin |
  | Admin      | true  |

  Given the following groups exist:
  | language | day      | time  | location |
  | Spanish  | Tuesday  | 2-3PM | 1 Evans  |
  | Mandarin | Monday   | 5-6PM | 1 Evans  |
  | German   | Friday   | 3-4PM | 10 Chavez |

Scenario: Admin can see groups
  Given I am an admin user
  When I am on the admin home page
  When I press "Show groups"
  Then I should see all groups

Scenario: Admin can add a group
  Given I am an admin user
  And I am on the add group page
  And I have filled out the form
  When I press "create group"
  Then I should be on the groups page
  
