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
    Then the user try searching for something on the search field

  @activity_stream
  Scenario: Validation on Activity Stream 
    Given an Oradian customer opens the login page
    When the user logs in
    And the user expects to see the dashboard page
    Then the user sees the lates activity stream

  @filter
  Scenario: Filtering dashboard by organisation structure 
    Given an Oradian customer opens the login page
    When the user logs in
    And the user expects to see the dashboard page
    And the user adds the filter rules
    Then the user expects to see the information filtered
  
  @profile 
  Scenario: Accessing profile page through dashboard
      Given an Oradian customer opens the login page
      When the user logs in
      And the user expects to see the dashboard page
      And the user clicks on user button on dashboard
      Then the user expects to see profile page