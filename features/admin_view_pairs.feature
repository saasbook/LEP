Feature:
  As an admin
  I want to view all pairs
  So that I can see all pairs on its own page

  Background: students have been put in pairs

    Given the following users exist:
    | id | first_name    | admin | active | email                 |
    | 1  | admin         | true  | true   | admin@berkeley.edu    |
    | 2  | aladdin       | false | true   | al@berkeley.edu       |
    | 3  | jasmine       | false | true   | j1@berkeley.edu       |
    | 4  | jasmine       | false | true   | j2@berkeley.edu       |
    | 5  | jasmine       | false | true   | j3@berkeley.edu       |
    | 6  | jasmine       | false | true   | j4@berkeley.edu       |
    | 7  | jasmine       | false | true   | j5@berkeley.edu       |
    | 8  | jasmine       | false | true   | j6@berkeley.edu       |

    Given the following pairings have been generated:
    | member1 |  member2 | member3 |      languages     |
    |    8    |    2     |    3    |  English, Chinese  |
    |    4    |    5     |         | French, Spanish    |
    |    6    |    7     |         | Chinese, Tagalog   |

    And I am an admin user
    And I sign in 

  Scenario:
    When I am on the pairing page
    Then I should see three pairs

