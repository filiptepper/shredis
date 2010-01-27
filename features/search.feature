Feature: Shredis Search
  In order to search Redis database keys
  I want to want to list found keys

  Scenario: No results
    Given Redis database 0
    When I go to the page of database 0
    And I fill in "query" with "search-key"
    And I press "search"
    Then I should see "No keys found."

  Scenario: One result
    Given Redis database 0
    And Redis string key "search-key" with value "search-value"
    When I go to the page of database 0
    And I fill in "query" with "search-key"
    And I press "search"
    Then I should see "search-value"
    And I should be on the page of database's 0 key "search-key"

  Scenario: Multiple results
    Given Redis database 0
    And Redis string key "search-key-0" with value "search-value-0"
    And Redis string key "search-key-1" with value "search-value-1"
    When I go to the page of database 0
    And I fill in "query" with "search-key-*"
    And I press "search"
    Then I should see "search-key-0"
    Then I should see "search-key-1"
