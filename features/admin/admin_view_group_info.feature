Feature: View group information 
  As an admin,
  I want to see the students and information about a group
  So that i knoew the logistics of that group

  Background: 
    Given the following groups exist:

    | group_id | members | time    | location     | language | day      | facilitator |
    | 1        | 1       | 11:00am | 2050 VLSB    | English  | Monday   | 2           |
    Given the following users exist:
    | id | first_name    | admin | active | email                 |
    | 1  | aladdin       | false | false  | active@berkeley.edu   |
    | 2  |  admin        | true  | true   | admin@berkeley.edu    |
    | 3  | jasmine       | false | true   | inactive@berkeley.edu |

    And I am an admin user
    When I sign in

  Scenario: Join a group
    Given I am on the groups page
    When I follow "View info" 
    Then I should see "aladdin"
    Then I should not see "jasmine"

