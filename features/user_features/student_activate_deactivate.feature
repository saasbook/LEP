Feature: Student user can deactivate or activate their profile

  As a student user
  So that I can participate in LEP in different semesters
  I want to the ability to activate and deactivate my profile
  
Background: student has a profile
  Given the following students exist:
  | first_name | last_name |  sid     |        email        | gender | fluent_languages | first_lang_preference |
  |  Billy    |   Bob     |  12345670 |  billy@berkeley.edu | male | [arabic] | english |
  |  Joe      |   Shmoe   |  12345671 |  joe@berkeley.edu   | male | [arabic] | english |
  | Sally    |   Sue     |  12345672 |  sally@berkeley.edu | male | [arabic] | english |
  | Jane     |   Doe     |  12345773 |  jane@berkeley.edu  | male | [arabic] | english |
  | John     |   Smith   |  12345374 |  john@berkeley.edu  | male | [arabic] | english |
  | Jerry    |  Maguire  |  12345975 |  jerry@berkeley.edu | male | [arabic] | english |


Scenario: student activates/deactivates
  #Given I am logged in as "Billy"
  #And I am on the existing user show page
  #When I press "deactivate"
  #Then I should see "Billy Bob's account has been deactivated"
  #When I press "activate"
  #Then I should see "Billy Bob's account has been reactivated"







