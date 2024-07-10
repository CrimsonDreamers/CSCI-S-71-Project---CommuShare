Feature: Search

  Scenario: Searching item by owner Daniel
    Given the app and the item
    When searching for the owner named Daniel 
    Then only one item should appear in the list