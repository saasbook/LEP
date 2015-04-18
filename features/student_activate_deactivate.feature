Feature: Student user can deactivate or activate their profile

  As a student user
  So that I can participate in LEP in different semesters
  I want to the ability to activate and deactivate my profile
  
Background: student has a profile
  Given the following students exist:
  | group_id | first_name | last_name |  sid     |        email        | gender | first_lang_preference | fluent_languages  |
  |    1     |   Billy    |   Bob     |  1234566 |  billy@berkeley.edu | male | english | [English] |
  |    1     |   Joe      |   Shmoe   |  1234567 |  joe@berkeley.edu   | male | english | [French]  |
  |    1     |   Sally    |   Sue     |  1234568 |  sally@berkeley.edu | male | english | [French]  |
  |    2     |   Jane     |   Doe     |  1234570 |  jane@berkeley.edu  | male | english | [French]  |
  |    2     |   John     |   Smith   |  1234530 |  john@berkeley.edu  | male | english | [German]  |
  |    3     |   Jerry    |  Maguire  |  1234591 |  jerry@berkeley.edu | male | english | [German]  |

Scenario: student activates/deactivates
  #Given I am logged in as "Billy"
  #And I am on the existing user show page
  #When I press "deactivate"
  #Then I should see "Billy Bob's account has been deactivated"
  #When I press "activate"
  #Then I should see "Billy Bob's account has been reactivated"







