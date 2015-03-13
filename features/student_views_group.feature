Feature: display group members when student user views their group

  As a student user
  So that I can know my group members
  I want to see a list of my group members
  
Background: student has been added to a group

  Given the following groups exist:
  |   id   |     languages     |
  |    1   |  arabic,english   | 
  |    2   | japanese,english  |

  Given the following students exist:
  | group_id | first_name | last_name |  sid  | email | gender | fluent_languages | first_lang_preference |
  |    1     |   Billy    |   Bob     |  1234566 |  billy@berkeley.edu | male | arabic | english |
  |    1     |   Joe      |   Shmoe   |  1234567 |  joe@berkeley.edu | male | arabic | english |
  |    1     |   Sally    |   Sue     |  1234568 |  sally@berkeley.edu | male | arabic | english |
  |    2     |   Jane     |   Doe     |  1234570 |  jane@berkeley.edu | male | japanese | english |
  |    2     |   John     |   Smith   |  1234530 |  john@berkeley.edu | male | japanese | english |
  |    2     |   Jerry    |  Maguire  |  1234591 |  jerry@berkeley.edu | male | japanese | english |

Scenario: student is in a group
  Given I am logged in as "Billy"
  Then I should see "Group Information"
  And I should see "Group Member"
  And I should see "Joe"
  And I should see "Sally"
  And I should not see "Jane"
  And I should not see "John"
  And I should not see "Jerry"


