require 'appium_lib'

class GameBoard < BaseMobileScreen

  Undo_action_xpath = "//android.view.View[@content-desc='Undo the current move?']"
  Start_game_action_xpath = "//android.view.View[@content-desc='Start a new game?']"
  Tiles_xpath = "(//android.view.View[@content-desc='Undo']/following-sibling::android.view.View//android.view.View)[2]//*[@content-desc='2' or @content-desc='4']"

  element(:board_desc_title, :xpath, "//android.view.View[@content-desc='Join the numbers and get to the 2048 tile!']")

  element(:new_game_btn, :xpath, "//android.view.View[@content-desc='New Game']")
  element(:new_game_confirmation_desc, :xpath, Start_game_action_xpath)
  element(:new_game_confirmation_btn, :xpath, "#{Start_game_action_xpath}/following-sibling::android.view.View//*[@content-desc='OK']")
  element(:new_game_cancel_btn, :xpath, "#{Start_game_action_xpath}/following-sibling::android.view.View//*[@content-desc='Cancel']")

  element(:undo_btn, :xpath, "//android.view.View[@content-desc='Undo']")
  element(:undo_confirmation_desc, :xpath, Undo_action_xpath)
  element(:undo_confirmation_btn, :xpath, "#{Undo_action_xpath}/following-sibling::android.view.View//*[@content-desc='Undo']")
  element(:undo_cancel_btn, :xpath, "#{Undo_action_xpath}/following-sibling::android.view.View//*[@content-desc='Cancel']")

  elements(:game_tiles, :xpath, "#{Tiles_xpath}")

  def being_shown?
    board_desc_title.enabled?
  end

  def choose_start_new_game
    new_game_btn.click
  end

  def confirm_new_game
    new_game_confirmation_btn.click
  end

  def choose_undo
    undo_btn.click
  end

  def confirm_undo_action
    undo_confirmation_btn.click
  end

  def move_tile
    @appium.swipe start_x: 0, start_y: 0, end_x: 100, end_y: 100, duration: 0.8
  end

end