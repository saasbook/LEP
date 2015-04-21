Feature: Student Edit Application
	As a student
	So that I can make changes or fix mistakes
	I want to be able to edit my application before the deadline

Background: 
  Given the following students exist:
  | group_id | first_name | last_name |  sid     | email               | gender | fluent_languages | first_lang_preference |
  |    1     |   Billy    |   Bob     |  1234566 |  billy@berkeley.edu | male | [arabic] | english |
  |    1     |   Joe      |   Shmoe   |  1234567 |  joe@berkeley.edu | male | [arabic] | english |
  |    1     |   Sally    |   Sue     |  1234568 |  sally@berkeley.edu | male | [arabic] | english |
  |    2     |   Jane     |   Doe     |  1234570 |  jane@berkeley.edu | male | [arabic] | english |
  |    2     |   John     |   Smith   |  1234530 |  john@berkeley.edu | male | [arabic] | english |
  |    3     |   Jerry    |  Maguire  |  1234591 |  jerry@berkeley.edu | male | [arabic] | english |

Scenario:
	Given I am logged in as "Billy"
	And I edit the application as "Billy"
	And I update email to "billyjoe@berkeley.edu"
	When I press "Submit"
	And I should see "billyjoe@berkeley.edu"