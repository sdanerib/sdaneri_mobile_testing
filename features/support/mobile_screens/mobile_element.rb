class MobileElement
  attr_accessor :elem_name, :find_by, :base_locator, :specific_locator, :parameter

  def initialize(name, by, base_locator_val, parameter_val=nil)
    @elem_name = name
    @find_by = by
    @base_locator = base_locator_val

    set_specific_locator_val(parameter_val)

  end

  def set_specific_locator_val(parameter_val=nil)
    @parameter = parameter_val unless parameter_val.nil?
    _specific_locator = @base_locator
                            .clone

    if _specific_locator.include? '[PARAMETER_TO_REPLACE]'
      _specific_locator.gsub!('[PARAMETER_TO_REPLACE]', @parameter)
    end

    @specific_locator = _specific_locator
  end

end