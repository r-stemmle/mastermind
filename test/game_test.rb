require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists_and_has_attributes
    secret_code = %w(b b b b)
    game = Game.new
    guess = Guess.new("rrgb")
    turn = Turn.new(guess, secret_code)

    assert_instance_of Game, game
  end

  def test_it_can_welcome_codebreaker_with_p
    skip
    secret_code = %w(b b b b)
    game = Game.new
    guess = Guess.new("rrgb")
    turn = Turn.new(guess, secret_code)

    assert_equal 'p', game.welcome
  end

  def test_it_can_provide_instructions_to_codebreaker_with_i
    skip
    secret_code = %w(b b b b)
    game = Game.new
    guess = Guess.new("rrgb")
    turn = Turn.new(guess, secret_code)
    expected = "You have four color code pegs to play in any combination for one given guess. Mastermind will provide feedback on the number of correct colors, and the number of correct positions."

    assert_equal expected, game.welcome
  end

  def test_it_can_exit_at_welcome_with_q
    skip
    secret_code = %w(b b b b)
    game = Game.new
    guess = Guess.new("q")
    turn = Turn.new(guess, secret_code)
    expected = "You have exited the game"

    assert_equal expected, game.welcome
  end

  def test_it_can_play_play_message
    skip
    secret_code = %w(b b b b)
    guess = Guess.new("rrrr")
    # turn = Turn.new(guess, secret_code)
    game = Game.new
    game.welcome

    test_text = "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"

    assert_equal test_text, game.play_message
  end

  def test_can_quit_during_play
    skip
    secret_code = %w(b b b b)
    guess = Guess.new("rrrr")
    game = Game.new
    game.play_message
    game.play

    test_text = "You have exited the game"

    assert_equal test_text, game.quits_game
  end

  def test_can_show_secret_code # Functions, but can't test in the loop
    skip
    game = Game.new
    secret_code = game.make_secret_code
    guess = Guess.new("rrrr")
    turn = Turn.new(guess, secret_code)
    game.welcome
    expected = "Hey Cheater, heres your code: #{@secret_code.join().upcase}"
    # require "pry"; binding.pry

    refute_equal expected, game.turn.get_secret_code
  end

  # def test_can_make_code_display_friendly
  #   skip
  #   secret_code = %w(b b b b)
  #   guess = 'rrrr'
  #   turn = Turn.new(guess, secret_code)
  #   game = Game.new(turn)
  #   turn.make_secret_code
  #   turn.secret_code = ['y', 'y', 'y', 'y']
  #
  #   assert_equal 'YYYY', game.code_display
  # end

  def test_it_says_guess_too_short
    skip
    turn = Turn.new #(guess)
    game = Game.new(turn)
    turn.make_secret_code

    assert_equal "Your guess is too short", game.welcome
  end
end
