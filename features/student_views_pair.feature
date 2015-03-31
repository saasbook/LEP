Feature: display pair members when student user views their pairing

  As a student user
  So that I can see my pairing
  I want to see a list of my pair members
  
Background: student has been added to a pair

  Given the following students exist:
  | pair_id | first_name | last_name |  sid  | email | gender | fluent_languages | first_lang_preference |
  |    1     |   Billy    |   Bob     |  1234566 |  billy@berkeley.edu | male | arabic | english |
  |    1     |   Joe      |   Shmoe   |  1234567 |  joe@berkeley.edu | male | arabic | english |
  |    2     |   Sally    |   Sue     |  1234568 |  sally@berkeley.edu | male | arabic | english |
  |    2     |   Jane     |   Doe     |  1234570 |  jane@berkeley.edu | male | arabic | english |
  |    3     |   John     |   Smith   |  1234530 |  john@berkeley.edu | male | arabic | english |
  |    3     |   Jerry    |  Maguire  |  1234591 |  jerry@berkeley.edu | male | arabic | english |

Scenario: student is in a group
  Given I am logged in as "Billy"
  Then I should see "Pair Information"
  And I should see "Pair Member"
  And I should see "Joe Schmoe"
  And I should not see "Sally Sue"
  And I should not see "Jane Doe"
  And I should not see "John Smith"
  And I should not see "Jerry Maguire"
