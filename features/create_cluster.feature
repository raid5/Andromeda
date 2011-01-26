Feature: Create a cluster
  As a user
  I want create a cluster
  So that members and content can be grouped

  Scenario: Successfully create a cluster
    Given I am authenticated as "adam@example.com" with password "passw0rd"
    When I create a cluster
    Then I should see "The cluster was saved successfully."

  Scenario: Failed to create a cluster
    Given I am authenticated as "adam@example.com" with password "passw0rd"
    When I create a cluster without all the requirements
    Then I should see "The cluster could not be saved."
    And I should see "Name can't be blank"

  Scenario: Not signed in
    Given I am not authenticated
    When I go to create a new cluster
    Then I am on the home page
    And I should see "You need to sign in or sign up before continuing."
  
  
