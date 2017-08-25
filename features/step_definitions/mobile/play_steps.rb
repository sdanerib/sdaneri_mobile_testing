Given(/^I have read the new updates of the game$/) do
  on(GameNewsScreen).being_shown?.should be true
  on(GameNewsScreen).dismiss_change_log
  on(GameBoard).being_shown?.should be true
end

When(/^I want to start a new game$/) do
  on(GameBoard).choose_start_new_game
end

Then(/^I should be able to confirm I want a new game$/) do
  on(GameBoard).confirm_new_game
end

And(/^I should be able to see (?:new|the) game board$/) do
  on(GameBoard).being_shown?.should be true
end

And(/^I make a movement$/) do
  on(GameBoard).move_tile
  sleep 1
end

Given(/^I've made a movement I regret$/) do
  step 'I have read the new updates of the game'
  step 'I make a movement'
end

When(/^I want to undo my movement$/) do
  on(GameBoard).choose_undo
end

Then(/^the app should ask me to confirm my action$/) do
  on(GameBoard).confirm_undo_action
end

