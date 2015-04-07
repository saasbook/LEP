Feature: Adjust permissions for users
  As an administrator
  I want to make other users language group facilitators or delete facilitators
  In order to set the right permissions

Background: admin has been added to database
  Given the following users exist:
  | id | first_name | last_name | admin | active | facilitator | email                 |
  | 1  | Aladdin    | A         | false | true   | false       | active@berkeley.edu   |
  | 2  |  Admin     | Ad        | true  | true   | false       | admin@berkeley.edu    |
  | 3  | Jasmine    | J         | false | true   | true        | inactive@berkeley.edu |

  And I am an admin user
  And I sign in

Scenario: Make an active user a facilitator
  Given I am on the admin home page
  #When I press "grant_f"
  #Then I should see "Aladdin A is now a language group facilitator"
  When I make Aladdin as a facilitator
  Then that user should be a facilitator

Scenario: Set a facilitator user to a non-facilitator user
  Given I am on the admin home page
  #When I press "revoke_f"
  #Then I should see "Jasmine J is no longer a language group facilitator"
  When I remove Jasmine as a facilitator
  Then that user should not be a facilitator 
