require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists_and_has_attributes
    # skip
    secret_code = %w(b b b b)
    difficulty_level = 4
    game = Game.new
    guess = Guess.new("rrgb", difficulty_level)
    turn = Turn.new(guess, secret_code, difficulty_level)

    assert_instance_of Game, game
  end

  def test_it_can_welcome_codebreaker_with_p
    skip
    secret_code = %w(b b b b)
    game = Game.new
    # This test has lost its neccessity

    assert_equal "Welcome to MASTERMIND", game.welcome
  end

  def test_it_can_provide_instructions_to_codebreaker_with_i
    skip
    secret_code = %w(b b b b)
    game = Game.new
    guess = Guess.new("rrgb", 4)
    turn = Turn.new(guess, secret_code, 4)
    expected = "You have 4, 6, or 8 (depending on selected difficulty level) color coded pegs to play in any combination for one given guess. Mastermind will provide feedback on the number of correct colors, and the number of correct positions."

    # This test does not function now that method calls 'welcome' method

    assert_equal expected, game.gives_instructions
  end

  def test_it_can_exit_at_welcome_with_q
    skip
    secret_code = %w(b b b b)
    game = Game.new
    guess = Guess.new("q", 4)
    turn = Turn.new(guess, secret_code, 4)
    expected = "You have exited the game"

    assert_equal expected, game.welcome
  end

  def test_it_can_play_play_message
    skip
    secret_code = %w(b b b b)
    guess = Guess.new("rrrr", 4)
    game = Game.new
    game.welcome

    expected = "You have chosen the #{difficulty_level}. Mastermind has constructed a secret sequence with #{difficulty_level} elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow#{intermediate_color} #{advanced_color} Use (q)uit at any time to end the game.  What's your guess?"

    # This test takes place in a loop

    assert_equal expected, game.play_message
  end

  def test_can_quit_during_play
    skip
    secret_code = %w(b b b b)
    guess = Guess.new("rrrr", 4)
    game = Game.new
    game.play_message
    game.play

    test_text = "You have exited the game"

    assert_equal test_text, game.quits_game
  end

  def test_can_show_secret_code
    skip
    game = Game.new
    secret_code = game.make_secret_code
    guess = Guess.new("rrrr", 4)
    turn = Turn.new(guess, secret_code, 4)
    game.welcome
    expected = "Hey Cheater, heres your code: #{@secret_code.join().upcase}"

    # This test takes place in a loop

    refute_equal expected, game.turn.get_secret_code
  end

  def test_it_can_count_guesses
    skip
    game = Game.new
    secret_code = game.make_secret_code
    guess = Guess.new("rrrr", 4)
    turn = Turn.new(guess, secret_code, 4)
    game.welcome

    # Must cheat when game starts and enter as first guess

    assert_equal 1, game.guess_count
  end

  def test_it_can_be_timed
    start_time = Time.now
    sleep(1)
    total_seconds_elapsed = (Time.now - start_time).round(0)
    minutes_elapsed = ((total_seconds_elapsed % 3600) / 60).to_i
    remaining_seconds = total_seconds_elapsed - (minutes_elapsed * 60)
    p minutes_elapsed
    p remaining_seconds
  end

  def test_player_can_choose_difficulty_level
    skip
    game = Game.new
    secret_code = %w(r g b g)
    guess = Guess.new("rrrr", @difficulty_level)
    turn = Turn.new(guess, secret_code, @difficulty_level)
    game.welcome

    # When testing enter 4 for difficulty

    assert_equal 4, game.difficulty_level
  end

  def test_all_combinations_changes_by_level
    skip
    game = Game.new
    game.welcome

    # Must enter 6 for difficulty

    assert_equal 15625, game.all_possible_codes.length
  end

  def test
  end

end
