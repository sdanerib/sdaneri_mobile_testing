@run_web
Feature: As a user
  I want the list of the least expensive apartment
  to rent in marina which has at least two bedrooms

  Scenario Outline: Search Apartment
    Given I'm want to <user_action> a(n) <property_type> located on <zone>
    And I'd like the property has at least <min_bedrooms>
    When I search for it
    And I sort results by <sort_options>
    Then I should be able to see the results page

    When I look for the <property_list_order> result of the page
    Then I should be able to confirm the property has <min_bedrooms>

    Examples:
      | user_action | property_type | zone    | min_bedrooms | sort_options | property_list_order |
      | Rent        | Apartment     | Marina  | 2 Beds       | Price (low)  | last                |
      | Buy         | Duplex        | Sharjah | 1 Bed        | Newest       | 2                   |
