Given(/^I'm want to (.*) a\(n\) (.*) located on (.*)$/) do |user_action, property_type, zone|
  visit(MainPage)
  on(MainPage).enter_preferred_zone(zone)
  on(MainPage).select_action(user_action)
  on(MainPage).select_property_type(property_type)


end

And(/^I'd like the property has at least (.*)$/) do |min_bedrooms|
  on(MainPage).select_min_beds(min_bedrooms)
end

When(/^I search for it$/) do
  sleep 2
  on(MainPage).do_search
end

And(/^I sort results by (.*)$/) do |sort_option|
  on(ResultsPage).select_sort_by(sort_option)
end

Then(/^I should be able to see the results page$/) do
  on(ResultsPage).get_results_count
  on(ResultsPage).is_list_results_displayed?.should be true
end

When(/^I look for the (.*) result of the page$/) do |property_list_order|
  on(ResultsPage).search_for_particular_result(property_list_order)
end

Then(/^I should be able to confirm the property has (.*)$/) do |min_bedrooms|
  on(ResultDetailPage).does_have_expected_bedrooms?(min_bedrooms).should be true
end