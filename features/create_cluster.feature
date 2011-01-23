Feature: Create a cluster
  As a user
  I want create a cluster
  So that members and content can be grouped

  Scenario: Successfully create a cluster
    Given I am a new, authenticated user
    When I create a cluster "Development"
    Then I should see "The cluster was saved successfully."

  Scenario: Failed to create a cluster
    Given I am a new, authenticated user
    When I create a cluster without all the requirements
    Then I should see "The cluster could not be saved."
    And I should see "Name can't be blank"
