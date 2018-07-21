@dashboard
Feature: As an Oradian customer
         I want to be able to use the dashboard

  @main
  Scenario: Quick validation on main aspects of dashboard page
    Given an Oradian customer opens the login page
    When the user logs in
    And the user expects to see the dashboard page
    And the user checks the main buttons on the left side of the page
    And the user checks the number of dashboards on the page
    And the user sees the latest activity stream
    And the user clicks on user button on dashboard
    And the user expects to see profile page
    And the user clicks on back 
    And the user adds the filter rules
    And the user expects to see the information filtered
    Then the user try searching for something on the search field
