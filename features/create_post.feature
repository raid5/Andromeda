Feature: Create post
  In order to supply a cluster with valuable content
  As a user
  I want to post content to clusters
  
  Background:
    Given the following clusters:
      | name                     | description                |
      | Design Cluster Name      | My awesome design cluster. |
      | Development Cluster Name | My more awesome dev clust. |

  Scenario: Not signed in
    Given I am not authenticated
    And I am on the cluster page for "Development Cluster Name"
    When I follow "Add Post"
    Then I am on the home page
    And I should see "You need to sign in or sign up before continuing."
  
  Scenario: Successfully create a URL post
    Given I am authenticated as "adam@example.com" with password "passw0rd"
    And I am on the cluster page for "Development Cluster Name"
    When I follow "Add Post"
    And I create a URL post
    Then I should see "The post was saved successfully."
  
  Scenario: Failed to create a URL post
    Given I am authenticated as "adam@example.com" with password "passw0rd"
    And I am on the cluster page for "Development Cluster Name"
    When I follow "Add Post"
    When I create a post without all the requirements
    Then I should see "The post could not be saved."
    And I should see "Title can't be blank"
  
  
  
  
