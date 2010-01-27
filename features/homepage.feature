Feature: Shredis Homepage
  In order to browse Redis databases
  I want to be redirected to databases list or default database

  Scenario: Empty database
    Given an empty Redis database
    When I go to the homepage
    Then I should see "No databases."

  Scenario: One database
    Given Redis database 3
    When I go to the homepage
    Then I should see "Current database: #3"

  Scenario: More databases
    Given Redis databases 1, 2
    When I go to the homepage
    Then I should see "#1"
    And I should see "#2"