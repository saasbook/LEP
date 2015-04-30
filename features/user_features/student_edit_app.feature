Feature: Student Edit Application
	As a student
	So that I can make changes or fix mistakes
	I want to be able to edit my application before the deadline

Background: 
  Given the following students exist:
  | first_name | last_name |  sid     | email               | gender | fluent_languages | first_lang_preference |
  | Billy    |   Bob     |  12345660 |  billy@berkeley.edu | male | [arabic] | english |
  | Joe      |   Shmoe   |  12345671 |  joe@berkeley.edu | male | [arabic] | english |
  | Sally    |   Sue     |  12345682 |  sally@berkeley.edu | male | [arabic] | english |
  | Jane     |   Doe     |  12345703 |  jane@berkeley.edu | male | [arabic] | english |
  | John     |   Smith   |  12345304 |  john@berkeley.edu | male | [arabic] | english |
  | Jerry    |  Maguire  |  12345915 |  jerry@berkeley.edu | male | [arabic] | english |

Scenario:
	Given I am logged in as "Billy"
	And I edit the application as "Billy"
	And I fill in "Berkeley Email" with "billyjoe@berkeley.edu"
	And I press "Submit"
	Then I should see "billyjoe@berkeley.edu"

