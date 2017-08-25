@run_android
Feature: As a user
  I want the play 2048 because its fun

  Scenario: Create New Game
    Given I have read the new updates of the game
    When I want to start a new game
    Then I should be able to confirm I want a new game
    And I should be able to see new game board

  Scenario: Undo movement
    Given I've made a movement I regret
    When I want to undo my movement
    Then the app should ask me to confirm my action
    And I should be able to see the game board
