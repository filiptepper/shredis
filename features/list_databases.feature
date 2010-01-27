Feature: Manage Redis Databases
  In order to browse Redis databases
  I want to list Redis databases

  Scenario: Empty Databases List
    Given an empty Redis database
    When I go to the list of databases
    Then I should see "No databases."

  Scenario: Current Databases List
    Given Redis databases 3, 6, 9
    When I go to the list of databases
    Then I should see "#3"
    And I should see "#6"
    And I should see "#9"

  Scenario: Wrong Database
    Given Redis databases 1, 2, 3
    When I go to the page of database 4
    Then I should see "Database doesn't exist."