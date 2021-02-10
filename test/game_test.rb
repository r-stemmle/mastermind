require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists_and_has_attributes
    guess = 'rrrr'
    turn = Turn.new(guess)
    game = Game.new(turn)

    assert_instance_of Game, game
  end

  def test_it_can_welcome_codebreaker
    guess = 'rrrr'
    turn = Turn.new(guess)
    game = Game.new(turn)

    assert_equal 'p' || 'i' || 'q', game.welcome
  end
end
