require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists_and_has_attributes
    game = Game.new
    guess = Guess.new("rrgb")
    turn = Turn.new(guess)


    assert_instance_of Game, game
  end

  def test_it_can_welcome_codebreaker_with_p
    skip
    game = Game.new
    guess = Guess.new("rrgb")
    turn = Turn.new(guess)

    assert_equal 'p', game.welcome
  end

  def test_it_can_provide_instructions_to_codebreaker_with_i
    skip
    game = Game.new
    guess = Guess.new("rrgb")
    turn = Turn.new(guess)
    expected = "You have four color code pegs to play in any combination for one given guess. Mastermind will provide feedback on the number of correct colors, and the number of correct positions."

    assert_equal expected, game.welcome
  end

  def test_it_can_exit_at_welcome_with_q
    skip
    game = Game.new
    guess = Guess.new("q")
    turn = Turn.new(guess)
    expected = "You have exited the game"

    assert_equal expected, game.welcome
  end

  def test_it_can_enter_play_mode
    skip
    guess = 'rrrr'
    turn = Turn.new(guess)
    game = Game.new(turn)

    test_text = "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"

    assert_equal 'rrrr', game.welcome
  end

  def test_can_quit_during_play
    skip
    test_text = "You have exited the game"

    assert_equal test_text, game.welcome
  end

  def test_can_make_code_display_friendly
    skip
    guess = 'rrrr'
    turn = Turn.new(guess)
    game = Game.new(turn)
    turn.make_secret_code
    turn.secret_code = ['y', 'y', 'y', 'y']

    assert_equal 'YYYY', game.code_display
  end

  # def test_can_show_secret_code
  #   # skip
  #   guess = 'rrrr'
  #   turn = Turn.new(guess)
  #   game = Game.new(turn)
  #   require "pry"; binding.pry
  #   turn.secret_code = ['y', 'y', 'y', 'y']
  #
  #   assert_equal 'YYYY', game.welcome
  # end
end
