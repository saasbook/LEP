Feature: Data Analytics for Admins
  As an admin
  I should be able to learn about how students are using LEP
  In order to better tailer future marketing and services

Background: 
  Given I am an admin user
  And I sign in
  And many students, pairs and groups exist

Scenario: Viewing data analytics
  When I go to the analytics page
  Then I should see data analytics

Scenario: Downloading data in a csv file
  When I go to the analytics page
  And I download the analytics
  Then I should have a csv file with all relevant information.
