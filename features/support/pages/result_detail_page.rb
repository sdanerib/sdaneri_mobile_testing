require 'json'

class ResultDetailPage
  include PageObject

  table(:result_facts, :class => "fixed-table")
  element(:beds_qty, :xpath => "//tr//th[@scope='row'][contains(text(),'Bedrooms')]/following-sibling::td")


  def does_have_expected_bedrooms?(min_bedrooms)

    exp_number_beds = min_bedrooms.split(' ')[0].to_i
    current_qty_beds = beds_qty_element.text.to_i
    puts "Showing table #{result_facts.to_s}"
    puts "Expected_number_beds #{exp_number_beds}\nCurrent Qty Bedrooms: #{current_qty_beds}"
    (current_qty_beds >= exp_number_beds)? true : false

  end

end