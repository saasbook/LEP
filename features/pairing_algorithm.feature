Feature: Generate pairings based on existing applications
  As an admin
  So that I can create pairings
  I want to be able to click a button to generate pairings

Background: I am an admin
  Given I am an admin user
  And I sign in

Scenario: Admin wants to create a pair
  Given the following applications have been submitted:
  | id | first_name | fluent_languages    | first_lang_preference | first_lang_proficiency | second_lang_preference | second_lang_proficiency | time_preference      | hours_per_week |
  | 1  | a          | [English]           | Chinese               | elementary             | nil                    | nil                     | [Monday, Wednesday]  | 3              |
  | 2  | b          | [Chinese]           | English               | elemenrary             | nil                    | nil                     | [Tuesday, Wednesday] | 2              |
  When I generate pairings
  Then there should be one pair

Scenario: Admin wants to create a triple
  Given the following applications have been submitted:
  | id | first_name | fluent_languages    | first_lang_preference | first_lang_proficiency | second_lang_preference | second_lang_proficiency | time_preference      | hours_per_week |
  | 1  | a          | [English, Spanish]  | Chinese               | elementary             | nil                    | nil                     | [Monday]             | 6              |
  | 2  | b          | [Chinese]           | English               | elementary             | nil                    | nil                     | [Friday]             | 1              |
  | 3  | c          | [French]            | Chinese               | elementary             | nil                    | nil                     | [Monday]             | 6              |
  When I generate pairings
  Then there should be one triple

Scenario: Admin wants to create multiple pairings
  Given the following applications have been submitted:
  | id | first_name | fluent_languages    | first_lang_preference | first_lang_proficiency | second_lang_preference | second_lang_proficiency | time_preference      | hours_per_week |
  | 1  | a          | [English, Spanish]  | French                | elementary             | nil                    | nil                     | [Monday, Tuesday]    | 4              |
  | 2  | b          | [English, Spanish]  | French                | elementary             | nil                    | nil                     | [Thursday, Friday]   | 2              |
  | 3  | c          | [French]            | Spanish               | elementary             | nil                    | nil                     | [Monday, Tuesday]    | 4              |
  | 4  | d          | [English]           | Chinese               | elementary             | nil                    | nil                     | [Wednesday]          | 3              |
  | 5  | e          | [French]            | English               | elementary             | nil                    | nil                     | [Thursday, Friday]   | 2              |
  When I generate pairings
  Then there should be one pair and one triple

Scenario: Admin wants to view all pairings
  Given the following pairings have been generated:
  | id | name    | languages                  |
  | 1  | a, b    | English, Chinese           |
  | 2  | c, d    | French, Spanish            |
  | 3  | f, g    | Chinese, Tagalog           |
  | 4  | h, i    | Korean, English            |
  #When I view pairs
