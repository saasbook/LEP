Feature: Generate pairings based on existing applications
  As an admin
  So that I can create pairings
  I want to be able to click a button to generate pairings

Background: I am an admin
  Given I am an admin user
  And I sign in

Scenario: Admin wants to create a pair
  Given that the following applications have been submitted:
  | id | first_name | fluent_languages | first_lang_preference | first_lang_proficiency | second_lang_preference | second_lang_proficiency |
  | 1  | a          | English          | Chinese               | elementary             | nil                    | nil                     |
  | 2  | b          | Chinese          | English               | elemenrary             | nil                    | nil                     |
  When I generate pairings
  Then there should be one pair

Scenario: Admin wants to create a triple
  Given that the following applications have been submitted:
  | id | first_name | fluent_languages | first_lang_preference | first_lang_proficiency | second_lang_preference | second_lang_proficiency |
  | 1  | a          | English          | French                | elementary             | nil                    | nil                     |
  | 2  | b          | Chinese          | English               | elementary             | nil                    | nil                     |
  | 3  | c          | French           | Chinese               | elementary             | nil                    | nil                     |
  When I generate pairings
  Then there should be one triple

Scenario: Admin wants to create multiple pairings
  Given that the following applications have been submitted:
  | id | first_name | fluent_languages | first_lang_preference | first_lang_proficiency | second_lang_preference | second_lang_proficiency |
  | 1  | a          | English          | French                | elementary             | nil                    | nil                     |
  | 2  | b          | Chinese          | English               | elementary             | nil                    | nil                     |
  | 3  | c          | French           | Chinese               | elementary             | nil                    | nil                     |
  | 4  | d          | Spanish          | Japanese              | elementary             | nil                    | nil                     |
  | 5  | e          | Japanese         | Spanish               | elementary             | nil                    | nil                     |
  When I generate pairings
  Then there should be one pair and one triple

Scenario: Admin wants to view all pairings
  Given the following pairings have been generated:
  | id | name    | languages                 |
  | 1  | a, b    | English, Chinese          |
  | 2  | c, d, e | French, Spanish, Japanese |
  | 3  | f, g    | Chinese, Tagalog          |
  | 4  | h, i    | Korean, English           |
  When I view pairs
  Then I should the following pair ids: 1, 2, 3, 4
