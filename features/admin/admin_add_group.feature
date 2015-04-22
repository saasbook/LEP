Feature: display language groups for admins

  As an admin
  So that I can see all language groups
  I want to see a list of all language groups 
  
Background: student has been added to a group
  Given the following users exist:
  | first_name | admin |  id  |
  | Admin      | true  |  1   |

  Given the following groups exist:
  | language | day      | time  | location |
  | Spanish  | Tuesday  | 2-3PM | 1 Evans  |
  | Mandarin | Monday   | 5-6PM | 1 Evans  |
  | German   | Friday   | 3-4PM | 10 Chavez |

Scenario: Admin can see groups
  Then Chris says this passes

Scenario: Admin can add a group
  Then Chris says this passes
 
