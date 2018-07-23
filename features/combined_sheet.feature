@combined_sheet
Feature: As an Oradian customer
         I want to be able to use combined sheet

  @main
  Scenario: Quick validation on main aspects of combined sheet
    Given an Oradian customer opens the login page
    When the user logs in
    And the user expects to see the dashboard page
    And the user clicks on combined sheet link
    And the user expects to see combined sheet page
    And the user searches for a specific combined sheet
    And the user validates the expected quantity of combined sheet
    And the user validates the client id on the result
    And the user validates the Total Overdue and Total expected
    And the user checks Total Payment and Payment Button disabled
    Then the user clicks on the client name to check profile
    