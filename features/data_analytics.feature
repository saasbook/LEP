Feature: Data Analytics for Admins
  As an admin
  I should be able to learn about how students are using LEP
  In order to better tailer future marketing and services

Background: 
  Given the following users exist:
  | id | first_name | email              | admin |
  | 1  | admin      | admin@berkeley.edu | true  |
  And I am an admin user
  And I sign in

Scenario: Viewing data analytics
  When I go to the admin analytics page
  Then I should see "Program Statistics"
  And I should see "Number of Applicants"
  And I should see "Number of Admins"
  And I should see "Major"

Scenario: Downloading data in a csv file
  When I go to the admin analytics page
  And I download the analytics
  Then I should have a csv file with all relevant information.
