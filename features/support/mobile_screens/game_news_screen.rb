require 'appium_lib'

class GameNewsScreen  < BaseMobileScreen

  element(:game_news_title, :xpath, "//android.widget.TextView[@text='Registro de cambios']")
  element(:change_log_accept_btn, :xpath, "//android.widget.Button[@text='Aceptar']")

  def being_shown?
    game_news_title.enabled?
  end

  def dismiss_change_log
    change_log_accept_btn.click
  end


end