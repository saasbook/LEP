Feature: Adjust permissions for users
  As an administrator
  I want to make other users language group facilitators or delete facilitators
  In order to set the right permissions

Background: admin has been added to database
  Given the following users exist:
  | id | first_name | last_name | admin | active | group_leader | facilitator | email                 |
  | 1  | Aladdin    | A         | false | true   | Yes          | false       | active@berkeley.edu   |
  | 2  |  Admin     | Ad        | true  | true   | Yes          | false       | admin@berkeley.edu    |
  | 3  | Jasmine    | J         | false | true   | Yes          | true        | inactive@berkeley.edu |

  And I am an admin user
  And I sign in

Scenario: Make an active user a facilitator
  Given I am on the users index page
  #When I press "grant_f"
  #Then I should see "Aladdin A is now a language group facilitator"
  When I make Aladdin as a facilitator
  Then that user should be a facilitator

Scenario: Set a facilitator user to a non-facilitator user
  Given I am on the users index page
  #When I press "revoke_f"
  #Then I should see "Jasmine J is no longer a language group facilitator"
  When I remove Jasmine as a facilitator
  Then that user should not be a facilitator 
