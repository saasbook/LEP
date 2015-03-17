Feature: Student user can deactivate or activate their profile

  As a student user
  So that I can participate in LEP in different semesters
  I want to the ability to activate and deactivate my profile
  
Background: student has a profile
  Given the following students exist:
  | group_id | first_name | last_name |  sid  | email | gender | fluent_languages | first_lang_preference |
  |    1     |   Billy    |   Bob     |  1234566 |  billy@berkeley.edu | male | arabic | english |
  |    1     |   Joe      |   Shmoe   |  1234567 |  joe@berkeley.edu | male | arabic | english |
  |    1     |   Sally    |   Sue     |  1234568 |  sally@berkeley.edu | male | arabic | english |
  |    2     |   Jane     |   Doe     |  1234570 |  jane@berkeley.edu | male | arabic | english |
  |    2     |   John     |   Smith   |  1234530 |  john@berkeley.edu | male | arabic | english |
  |    3     |   Jerry    |  Maguire  |  1234591 |  jerry@berkeley.edu | male | arabic | english |

Scenario: student activates/deactivates
  Given I am logged in as "Sally"
  #Then I should be on the existing user show page
  And I am on the existing user show page
  When I press “Deactivate”
  Then I should see "Your profile is now deactivated"
  When I press “Activate” 
  Then I should see "Your profile is now deactivated"







