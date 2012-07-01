Feature: Visiting the front page
  Scenario: While not logged in
    When I visit the landing page
    Then I should see the site's welcome message
      And I should see the shiny button to create a company
