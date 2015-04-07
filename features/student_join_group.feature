Feature: Join group
  In order to learn languages
  As a student user
  I want to be able to join a language group

  Background: 
    Given the following groups exist:
    | group_id | members                             | time    | location     | language | day      |
    | 1        | Jason Jia, Iris Wang, Shana Hu      | 11:00am | 2050 VLSB    | English  | Monday   |
    | 2        | Robyn Zhang, Tsion B, Seungwoo Choi | 3:00pm  | 204 Dwinelle | Japanses | Thursday |
    And the following users exist:
    | id | first_name | email                 | admin |
    | 1  | exisiting  | existing@berkeley.edu | false |
    And I am a existing user
    When I sign in

  Scenario: Join a group
    When I join group 1
    Then I should see "Language Groups"
    Then I should belong to a group

Scenario: Leave a group
    Given I join group 2
    When I leave group 2
    Then I should not belong to a group
