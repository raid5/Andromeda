Feature: Viewing posts
  In order to find and interact with posts
  As a user
  I want to view available posts
  
  Background:
    Given the following clusters:
      | name                     | description                |
      | Design Cluster Name      | My awesome design cluster. |
  
  Scenario: Viewing cluster with no posts
    Given no posts exist for "Design Cluster Name"
    When I view all clusters
    And I follow "Design Cluster Name"
    Then I should be on the cluster page for "Design Cluster Name"
    And I should see "No posts."
  
  Scenario: Viewing cluster with many posts
    Given the following posts for "Design Cluster Name":
      | url                | title    | description |
      | http://apost.com   | A post   | My post.    |
      | http://thepost.com | The post | Your post.  |
    When I view all clusters
    And I follow "Design Cluster Name"
    Then I should be on the cluster page for "Design Cluster Name"
    And I should see "A post"
    And I should see "The post"
  
  
  
  
  