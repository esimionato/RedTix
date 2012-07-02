Feature: Creating an Organization
  Scenario: With Valid Parameters
    When I visit the landing page
      And I click on the shiny button to create my Organization
      And I enter valid details
    Then I should be on the landing page
      And I should see a successful organization creation
