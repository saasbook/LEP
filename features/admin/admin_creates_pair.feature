Feature: Admin creates user pair

	As an admin
	I want to be able to create a new user pair 
	So i should have a create new pair option

Background: student has been added to a group
  Given the following users exist:
  | id | first_name    | admin | active | email                  |
  | 1  | admin         | true  | true   | admin@berkeley.edu     |
  | 2  | aladdin       | false | true   | aladdin@berkeley.edu   |
  | 3  | bob           | false | true   | bob@berkeley.edu       |
  | 4  | jasmine       | false | true   | jasmine@berkeley.edu   |

  And I am an admin user
  And I sign in

Scenario: Admin creates pair
  Given I am on the pairing page
  And I fill in "User 1 Email" with "aladdin@berkeley.edu"
  And I fill in "User 2 Email" with "bob@berkeley.edu"
  And I fill in "User 3 Email" with "jasmine@berkeley.edu"
  And I press "Manually Create Pair"
  Then I should see "aladdin"

  #Then I should be on the admin home page

