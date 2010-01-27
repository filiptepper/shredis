Feature: Redis Database Status
  In order to check current Redis database status
  I want to display INFO command value

  Scenario: Homepage
    Given an empty Redis database
    When I go to the homepage
    Then I should see "Status"
    And I should see "Redis"
    And I should see "Uptime"
    And I should see "Connected clients"
    And I should see "Used memory"
    And I should see "Last save time"