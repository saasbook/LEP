Feature: display group members when student user views their group

  As a student user
  So that I can know my group members
  I want to see a list of my group members
  
Background: student has been added to a group

  Given the following students exist:
  | first_name | last_name |  sid     | email               | gender | fluent_languages | first_lang_preference |
  | Billy    |   Bob     |  12345660 |  billy@berkeley.edu | male | [arabic] | english |
  | Joe      |   Shmoe   |  12345671 |  joe@berkeley.edu | male | [arabic] | english |
  | Sally    |   Sue     |  12345682 |  sally@berkeley.edu | male | [arabic] | english |
  | Jane     |   Doe     |  12345703 |  jane@berkeley.edu | male | [arabic] | english |
  | John     |   Smith   |  12345304 |  john@berkeley.edu | male | [arabic] | english |
  | Jerry    |  Maguire  |  12345915 |  jerry@berkeley.edu | male | [arabic] | english |

  Given the following groups exist:
  | language | day      | time  | location | members |
  | Arabic  | Tuesday  | 2-3PM | 1 Evans  |    1,2,3   |

Scenario: student is in a group
  Given I am logged in as "Billy"
  Then I should see "Groups you attend"
  Then I should see "Arabic"
  Then I should see "2-3PM on Tuesdays, 1 Evans"


