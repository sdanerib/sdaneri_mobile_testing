class BaseMobileScreen
  include Singleton

  def elem_list
    @list ||= []
  end

  def set_driver(appium_driver)
    @appium = appium_driver
  end

  def self.element(name, by, locator)

    define_method(name) do |parameter=nil|

      mobile_elem = elem_list.find {|e| e.elem_name == name}

      if mobile_elem.nil?
        mobile_elem = MobileElement.new(name, by, locator)
        elem_list.push(mobile_elem)
      end

      mobile_elem.set_specific_locator_val(parameter)
      Selenium::WebDriver::Wait.new(:timeout => 30, :message => "Timeout waiting for #{name}").until {
        @appium.find_elements(mobile_elem.find_by, mobile_elem.specific_locator).size > 0
      }
      puts "mobile_elem.find_by #{mobile_elem.find_by}, \nmobile_elem.specific_locator #{mobile_elem.specific_locator}"
      @appium.find_element(mobile_elem.find_by, mobile_elem.specific_locator)

    end

  end

  def self.elements(name, by, locator)
    define_method(name) do
      @appium.find_elements(by, locator)
    end
  end

end