
module StepsHelper
  def on(mobile_screen)
    screen_object_instance = eval("#{mobile_screen.to_s}.instance")
    screen_object_instance.set_driver(@appium)
    screen_object_instance
  end

end
World(StepsHelper)