Feature: Viewing clusters
  In order to find and interact with clusters
  As a user
  I want to view available clusters

  Scenario: I have clusters
    Given I am authenticated as "adam@example.com" with password "passw0rd"
    And I have the following clusters:
      | name        | description                |
      | Design      | My awesome design cluster. |
      | Development | My more awesome dev clust. |
    When I view my clusters
    Then I should see "Design"
    And I should see "Development"
  
  Scenario: I have no clusters
    Given I am authenticated as "adam@example.com" with password "passw0rd"
    And I have no clusters
    When I view my clusters
    Then I should see "No clusters."
    
  Scenario: Clusters exist
    Given the following clusters:
      | name        | description                |
      | Design      | My awesome design cluster. |
      | Development | My more awesome dev clust. |
      | Cooking     | Cookin it up.              |
      | Chopping    | Choppin it down.           |
      | Dancing     | DANCE.DANCE.DANCE          |
    When I view all clusters
    Then I should see "Design"
    And I should see "Development"
    And I should see "Cooking"
    And I should see "Chopping"
    And I should see "Dancing"
    
  Scenario: An individual cluster via browse
    Given the following clusters:
      | name                     | description                |
      | Design Cluster Name      | My awesome design cluster. |
      | Development Cluster Name | My more awesome dev clust. |
    When I view all clusters
    And I follow "Development Cluster Name"
    Then I should be on the cluster page for "Development Cluster Name"
    And I should see "Development Cluster Name"
  
  
  

