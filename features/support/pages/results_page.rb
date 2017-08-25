class ResultsPage
  include PageObject

  button(:sort_by_opt, :xpath => "//button[contains(@class,'ms-choice')]/span[contains(text(),'Featured')]")
  label(:list_result, :class => "list-count")
  divs(:result, :class => "listing-content")
  BASE_XPATH = "(//div[contains(@class,'ms-drop')]//*[contains(text(),'[CHOSEN_OPTION]')])[1]"

  def select_sort_by(sort_opt)
    sort_by_opt_element.click

    sort_choice = BASE_XPATH
    sort_choice = sort_choice.gsub('[CHOSEN_OPTION]', sort_opt.strip)
    element(:sort_opt_element, :xpath => sort_choice).click
    sleep 2
  end

  def get_results_count
    puts "#{list_result_element.text}"
  end

  def is_list_results_displayed?
    list_result_element.visible?
  end

  def search_for_particular_result(property_list_order)

    order_number = property_list_order.split(' ')[0].downcase.strip
    qty_items = result_elements.size
    puts "property_list_order > elements >>> #{qty_items}"

    case order_number
      when 'last'
        result_elements.last.click

      when 'first'
        result_elements.first.click

      else
        index = order_number.to_i

        if index < qty_items
          index = index - 1
          result_elements.at(index).click
        end
    end

  end


end