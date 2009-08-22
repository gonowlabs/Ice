Feature: Contract
  As a administrator
  I want to be able to create new contracts
  In order to manage user workload entries

  Scenario: default
    Given I am on new contracts page
    And I fill in "Name" with "Web 2.0"
    And I fill in "Description" with "Web 2.0 contract with Chile's guys"
    And I press "Create"
    Then I should have a "contract" with "Name" "Web 2.0"
