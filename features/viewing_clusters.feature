Feature: Viewing clusters
  In order to find and interact with clusters
  As a user
  I want to view available clusters

  Scenario: Clusters exist
    Given I am authenticated as "adam@example.com" with password "passw0rd"
    And I have the following clusters:
      | name        | description                |
      | Design      | My awesome design cluster. |
      | Development | My more awesome dev clust. |
    When I view my clusters
    Then I should see "Design"
    And I should see "Development"
  
  Scenario: No clusters exist
    Given I am authenticated as "adam@example.com" with password "passw0rd"
    And I have no clusters
    When I view my clusters
    Then I should see "No clusters."