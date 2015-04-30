Feature: Join group
  In order to learn languages
  As a student user
  I want to be able to join a language group

  Background: 
    Given the following groups exist:
    | group_id | members | time    | location     | language | day      |
    | 1        | 4, 5, 6 | 11:00am | 2050 VLSB    | English  | Monday   |
    | 2        | 7, 8, 9 | 3:00pm  | 204 Dwinelle | Japanses | Thursday |
    And the following students exist:
    | id | first_name | last_name | sid      | email                 | fluent_languages | first_lang_preference | facilitator |
    | 1  | exisiting  | user      | 12345678 | existing@berkeley.edu | English, Spanish | Japanese              | false       |
    And I am a existing user
    When I sign in

Scenario: Join a group
    When User "1" joins group "1"
    Then User "1" should belong to group "1"

Scenario: Leave a group
    Given User "2" joins group "2"
    When User "2" leaves group "2"
    Then User "2" should not belong to group "2"
    When I go to the groups page
    Then I should not see "Leave Group"
