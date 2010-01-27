Feature: Browse Redis Database Keys
  In order to browse Redis database keys
  I want to list current Redis database keys

  Scenario: Empty Database
    Given empty Redis database 15
    When I go to the page of database 15 keys
    Then I should see "Database doesn't exist."

  Scenario: Database With Keys
    Given Redis database 15
    When I go to the page of database 15
    Then I should see "shredder:key:15"

  Scenario: Databases With Keys
    Given Redis databases 14, 15
    When I go to the homepage
    When I follow "#14"
    Then I should see "shredder:key:14"

  Scenario: Non-Existing Key
    Given Redis database 15
    When I go to the page of database's 15 key "shredder:key:51"
    Then I should see "Key doesn't exist."

  Scenario: String Key
    Given Redis database 15
    And Redis string key "string:key" with value "my-string"
    When I go to the page of database 15
    When I follow "string:key"
    Then I should see "my-string"

  Scenario: List Key
    Given Redis database 15
    And Redis list key "list:key" with values "my-list-1, my-list-2, my-list-3"
    When I go to the page of database 15
    When I follow "list:key"
    Then I should see "my-list-1"
    And I should see "my-list-2"
    And I should see "my-list-3"

  Scenario: Set Key
    Given Redis database 15
    And Redis set key "set:key" with values "my-set-1, my-set-2, my-set-3"
    When I go to the page of database 15
    When I follow "set:key"
    Then I should see "my-set-1"
    And I should see "my-set-2"
    And I should see "my-set-3"

  Scenario: Sorted Set Key
    Given Redis database 15
    And Redis sorted set key "zset:key" with values "my-zset-1, my-zset-2, my-zset-3"
    When I go to the page of database 15
    When I follow "zset:key"
    Then I should see "my-zset-1"
    And I should see "my-zset-2"
    And I should see "my-zset-3"