Feature: Events
  In order to see what's going on
  As a user
  I should be able to see all events

  Scenario: Display List of Events
    Given there have been the following events:
      | date       | type      | description           |
      | 2014-12-11 | alert     | Something went wrong  |
      | 2014-12-12 | emergency | Printer on fire!      |
      | 2014-12-13 | warning   | Something went wrong  |
      | 2014-12-14 | info      | New user: Bob         |
      | 2014-12-15 | alert     | Something went wrong  |
      | 2014-12-16 | alert     | Something went wrong  |
      | 2014-12-17 | info      | New user: Jim         |
      | 2014-12-18 | alert     | Something went wrong  |
      | 2014-12-19 | alert     | Something went wrong  |
      | 2014-12-20 | alert     | Something went wrong  |
      | 2014-12-21 | info      | New user: Sue         |
    And I am on the home page
    When I click on the Events tab
    Then I should see the following events (in this order):
      | date       | type      | description           |
      | 2014-12-11 | alert     | Something went wrong  |
      | 2014-12-12 | emergency | Printer on fire!      |
      | 2014-12-13 | warning   | Something went wrong  |
      | 2014-12-14 | info      | New user: Bob         |
      | 2014-12-15 | alert     | Something went wrong  |
      | 2014-12-16 | alert     | Something went wrong  |
      | 2014-12-17 | info      | New user: Jim         |
      | 2014-12-18 | alert     | Something went wrong  |
      | 2014-12-19 | alert     | Something went wrong  |
      | 2014-12-20 | alert     | Something went wrong  |
    When I click on the Next button
    Then I should see the following events:
      | date       | type      | description           |
      | 2014-12-21 | info      | New user: Sue         |
    When I click Previous
    And I click Sort by Type
    Then I should see the following events (in this order):
      | date       | type      | description           |
      | 2014-12-12 | emergency | Printer on fire!      |
      | 2014-12-11 | alert     | Something went wrong  |
      | 2014-12-15 | alert     | Something went wrong  |
      | 2014-12-16 | alert     | Something went wrong  |
      | 2014-12-18 | alert     | Something went wrong  |
      | 2014-12-19 | alert     | Something went wrong  |
      | 2014-12-20 | alert     | Something went wrong  |
      | 2014-12-13 | warning   | Something went wrong  |
      | 2014-12-14 | info      | New user: Bob         |
      | 2014-12-17 | info      | New user: Jim         |
