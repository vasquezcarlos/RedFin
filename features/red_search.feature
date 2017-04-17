Feature: Redfin Search
  As a potential home buyer
  I want to find a home which meets the
  criteria of my ideal home.

Scenario: Navigate to RedFin and login
 Given I am on Redfin
 Given I Login into Refin
 Then I should see the logout link

Scenario: Search for the ideal home by using filters
 Given I search for a property in a city
  Then I should be able to see a list of properties
 When I use filters
  Then Results should match criteria
