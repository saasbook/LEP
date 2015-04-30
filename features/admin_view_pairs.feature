Feature:
  As an admin
  I want to view all pairs
  So that I can see all pairs on its own page

  Background: students have been put in pairs
    Given that the following pairs exist:
      | id | member1 |  member2 | member3 |      languages     |
      | 1  |    1    |    2     |    3    |  English, Chinese  |
      | 2  |    4    |    5     |         | French, Spanish    |
      | 3  |    6    |    7     |         | Chinese, Tagalog   |

    Scenario:
      Given I am on the users page
      And I press "View all pairs"
      Then I should see "Member 1"
      Then I should see "Member 2"
      Then I should see "Member 3"
      Then I should see "Member 4"
      Then I should see "Member 5"
      Then I should see "Member 6"
      Then I should see "Member 7"
