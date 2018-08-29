Feature: Authentication

   In order to use the website
   As a user
   I should be able to sign up, log in and log out

Scenario: Signing up
        Given I visit the homepage
        When I click the Sign Up Button
        And I fill in the Sign up form
        Then I should see that I am in the vehicle registration page.
