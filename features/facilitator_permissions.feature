Feature: Give language group facilitators extra group permissions

  As a language group facilitator
  So that I can lead language groups
  I want to have extra permissions
  
Background: student has been added to a group
  Given the following users exist:
  | first_name    | facilitator |  id  |
  | Facilitator   | true        |  27   |

  Given the following groups exist:
  | language | day      | time  | location |
  | Spanish  | Tuesday  | 2-3PM | 1 Evans  |
  | Mandarin | Monday   | 5-6PM | 1 Evans  |
  | German   | Friday   | 3-4PM | 10 Chavez |

Scenario: Facilitator creates language group
  Given I am a facilitator user,
  When I am on the user home page
  When I press "Create Language Group"
  Then I should be on the add group page

#facilitator delete language group???

Scenario: Facilitator submits language group info
  Given I am a facilitator user
  When I am on the create language group page
  When I press "Submit"
  Then I should be on the language group page

Scenario: Facilitator views group info
  Given I am a facilitator user
  When I press "view language group"
  Then I should see "Student Roster"
  Then I should see "Time and Place"
  Then I should see "Language Taught"





