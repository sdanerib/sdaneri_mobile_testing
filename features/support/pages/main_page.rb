class MainPage
  include PageObject

  AE_WEBSITE = "http://www.random.page"
  page_url AE_WEBSITE

  text_field(:zone_input, :xpath => "//input[@name='q'][@type='search']")
  button(:open_action_opt, :xpath => "(//button[@class='ms-choice']/span[contains(text(),'Rent')])[1]")
  button(:open_property_type_opt, :xpath => "//button[contains(@class,'ms-choice')]/span[contains(text(),'Property type')]")
  button(:open_min_beds_opt, :xpath => "//button[contains(@class,'ms-choice')]/span[contains(text(),'Min. bed')]")
  button(:search_btn, :xpath => "//button[@type='submit']")
  text_field(:keyword, :name => "kw")

  BASE_XPATH = "(//div[contains(@class,'ms-drop')]//*[contains(text(),'[CHOSEN_OPTION]')])[1]"

  def enter_preferred_zone(zone)
    zone_input_element.send_keys zone
    sleep 2
  end

  def select_action(user_action)
    open_action_opt_element.click
    puts "user_action.strip >>> #{user_action.strip}"

    user_action_choice = BASE_XPATH
    user_action_choice = user_action_choice.gsub('[CHOSEN_OPTION]', user_action.strip)
    puts "updated user_action_choice >>> #{user_action_choice}"

    element(:user_action_btn, :xpath => user_action_choice).click
    sleep 2
  end

  def select_property_type(property_type)
    open_property_type_opt_element.click
    puts "\nproperty_type.strip >>> #{property_type.strip}"

    property_type_choice = BASE_XPATH
    property_type_choice = property_type_choice.gsub('[CHOSEN_OPTION]', property_type.strip)
    puts "updated property_type_choice >>> #{property_type_choice}"

    element(:chosen_property, :xpath => property_type_choice).click
    sleep 2
  end

  def select_min_beds(min_bedrooms)
    open_min_beds_opt_element.click
    puts "\nmin_bedrooms.strip >>> #{min_bedrooms.strip}"

    min_beds_choice = BASE_XPATH
    min_beds_choice = min_beds_choice.gsub('[CHOSEN_OPTION]', min_bedrooms.strip)
    puts "updated min_beds_choice >>> #{min_beds_choice}"

    element(:min_beds_choice, :xpath => min_beds_choice).click
    sleep 2
  end

  def do_search
    Selenium::WebDriver::Wait.new(:timeout => 30, :message => "#{__method__} failed").until {
      search_btn_element.visible?
    }
    search_btn_element.click
  end

end