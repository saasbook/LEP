Feature: display group members when student user views their group

  As a student user
  So that I can know my group members
  I want to see a list of my group members
  
Background: student has been added to a group

  Given the following students are in a group:
  | name       | group number |
  | Billy Bob  |       1      |  
  | Joe Schmoe |       1      |
  | Sally Sue  |       1      |
  | Jane Doe   |       2      |
  | John Smith |       2      |

  And  I am on the LEP home page and I am Billy Bob

Scenario: student is in a group

  When I press "View Group"
  Then I should see "Billy Bob"
  Then I should see "Joe Schmoe"
  Then I should see "Sally Sue"
  Then I should not see "Jane Doe"
  Then I should not see "John Smith"

Scenario: student is not in a group
  When I press "View Group"
  Then I should see an error message


