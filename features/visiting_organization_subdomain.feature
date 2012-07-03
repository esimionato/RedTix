Feature: Visiting Organization subdomain
  Scenario: With an existing organization
    Given there is an Organization
    When I visit the Organization's dashboard
    Then I should see the Organization's information
