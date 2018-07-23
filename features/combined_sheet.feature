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