Feature: Creating an Organization
  Scenario: With Valid Parameters
    When I visit the landing page
      And I click on the shiny button to create my Organization
      And I enter valid details
    Then I should be on the landing page
      And I should see a successful organization creation

  Scenario: With Invalid Parameters
    When I visit the landing page
      And I click on the shiny button to create my Organization
      And I enter invalid details
    Then I should see error messages

  Scenario: Visiting an unkown subdomain
    When I visit a subdomain that does not yet exist
    Then I should be at the Organization signup page
      And I should see the subdomain already filled in for me
      And I should see a message that says that subdomain is available
