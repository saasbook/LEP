Feature: display group members when student user views their group

  As a student user
  So that I can know my group members
  I want to see a list of my group members
  
Background: student has been added to a group

  Given the following pairs exist:
  |   id     |        name       |  languages |
  |    1     |       Admin       |    Null    |
  |    2     | Unpaired Students |  arb,eng   |

  Given the following users exist:
  | pair_id | first_name | last_name |  email | gender | fluent_languages | first_lang_preference |
  |   2     |   Billy    |   Bob     |  billy@berkeley.edu | male | arabic | english |
  |   2     |   Joe      |   Shmoe   |  joe@berkeley.edu | male | arabic | english |
  |   2     |   Sally    |   Sue     |  sally@berkeley.edu | male | arabic | english |
  |   2     |   Jane     |   Doe     |  jane@berkeley.edu | male | arabic | english |
  |   2     |   John     |   Smith   |  john@berkeley.edu | male | arabic | english |
  |   2     |   Jerry    |  Maguire  |  jerry@berkeley.edu | male | arabic | english |

Scenario: student is in a group
  Given I am logged in as "Billy"
  Then I should see "Group Information"
  And I should see "Group Member"
  And I should see "Joe Schmoe"
  And I should see "Sally Sue"
  And I should not see "Jane Doe"
  And I should not see "John Smith"
  And I should not see "Jerry Maguire"

