Feature: User authentication
  In order to perform useful, authenticated actions
  As a user
  I want authenticate a user

Scenario Outline: Creating a new account
    Given I am not authenticated
    When I go to register
    And I fill in "user_email" with "<email>"
    And I fill in "user_password" with "<password>"
    And I fill in "user_password_confirmation" with "<password>"
    And I press "Sign up"
    Then I should see "You have signed up successfully."
    And I should see "<email>"

    Examples:
      | email        | password |
      | test@big.mac | bigmac   |
      | foo@bar.com  | fr33z3   |

Scenario Outline: Signing into an account
  Given I am not authenticated
  And I have one user "<email>" with password "<password>"
  When I go to login
  And I fill in "user_email" with "<email>"
  And I fill in "user_password" with "<password>"
  And I press "Sign in"
  Then I should see "Signed in successfully."
  And I should see "<email>"
  
  Examples:
    | email        | password   |
    | adam@big.mac | passw0rd   |
    | d@hoang.org  | secretpass |
