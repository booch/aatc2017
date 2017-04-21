Feature: Events
  In order to see what's going on
  As a user
  I should be able to see all events

  Background:
    Given there have been the following events:
      | event | date       | type      | description          |
      | 1     | 2014-12-11 | alert     | Something went wrong |
      | 2     | 2014-12-12 | emergency | Printer on fire!     |
      | 3     | 2014-12-13 | warning   | Something went wrong |
      | 4     | 2014-12-14 | info      | New user: Bob        |
      | 5     | 2014-12-15 | alert     | Something went wrong |
      | 6     | 2014-12-16 | alert     | Something went wrong |
      | 7     | 2014-12-17 | info      | New user: Jim        |
      | 8     | 2014-12-18 | alert     | Something went wrong |
      | 9     | 2014-12-19 | alert     | Something went wrong |
      | 10    | 2014-12-20 | alert     | Something went wrong |
      | 11    | 2014-12-21 | info      | New user: Sue        |

  Scenario: Events page can be sorted
    Given I am on the Events tab of the home page
    When I click Sort by Type
    Then I should see events sorted first in decreasing order by type
    And  I should see events sorted second in increasing order by date

  @wip
  Scenario: Events page shows ten events by default
    Given I am on the Events tab of the home page
    Then I should see events #1-10

  @wip
  Scenario: Events page includes pagination links
    Given I am on the Events tab of the home page
    When I click on the Next button
    Then I should see event #11

