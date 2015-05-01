Feature: Admin creates user pair

	As an admin
	I want to be able to create a new user pair 
	So i should have a create new pair option

Background: student has been added to a group
  Given the following users exist:
  | id | first_name    | admin | active | email                  |
  | 1  | aladdin       | false | true   | aladdin@berkeley.edu   |
  | 2  | bob           | false | true   | bob@berkeley.edu       |
  | 3  | jasmine       | false | true   | jasmine@berkeley.edu   |
  | 4  | admin         | true  | true   | admin@berkeley.edu     |


Scenario: Admin creates pair
    Given I am logged in as "admin"
    And I am on the pairs page
    And I fill in "User 1 Email" with "aladdin@berkeley.edu"
    And I fill in "User 2 Email" with "bob@berkeley.edu"
    And I fill in "User 3 Email" with "jasmine@berkeley.edu"
    And I click "Manually Create Pair"
    Then I should see "aladdin"

    #Then I should be on the admin home page

