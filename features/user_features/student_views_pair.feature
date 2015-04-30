Feature: display pair members when student user views their pairing

  As a student user
  So that I can see my pairing
  I want to see a list of my pair members
  
Background: student has been added to a pair

  Given the following students exist:
  | first_name | last_name |  sid     | email               | gender | fluent_languages | first_lang_preference |
  | Billy    |   Bob     |  12345660 |  billy@berkeley.edu | male | [arabic] | english |
  | Joe      |   Shmoe   |  12345671 |  joe@berkeley.edu | male | [arabic] | english |
  | Sally    |   Sue     |  12345682 |  sally@berkeley.edu | male | [arabic] | english |
  | Jane     |   Doe     |  12345703 |  jane@berkeley.edu | male | [arabic] | english |
  | John     |   Smith   |  12345304 |  john@berkeley.edu | male | [arabic] | english |
  | Jerry    |  Maguire  |  12345915 |  jerry@berkeley.edu | male | [arabic] | english |

Scenario: student is in a group
  Given I am logged in as "Billy"
  Then I should see "Pair Information"
  And I should see "You are not currently in a pair"
  And I should not see "Joe Schmoe"
  And I should not see "Sally Sue"
  And I should not see "Jane Doe"
  And I should not see "John Smith"
  And I should not see "Jerry Maguire"

