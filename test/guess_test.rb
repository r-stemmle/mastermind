require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess.rb'
require './lib/turn.rb'


class PlayerTest < Minitest::Test

  def test_it_exists
    user_entry = "rrgb"
    difficulty_entry = 4
    guess = Guess.new(user_entry, difficulty_entry)

    assert_instance_of Guess, guess
  end

  def test_it_has_attributes
    user_entry = "rrgb"
    difficulty_entry = 4
    guess = Guess.new(user_entry, difficulty_entry)

    assert_equal %w(r r g b), guess.code_guess
  end

  def test_if_guess_is_too_short
    user_entry = "rrg"
    difficulty_entry = 4
    guess = Guess.new(user_entry, difficulty_entry)

    assert_equal true, guess.too_short?
  end

  def test_if_guess_is_too_long
    user_entry = "rrrrrrrrrrg"
    difficulty_entry = 4
    guess = Guess.new(user_entry, difficulty_entry)

    assert_equal true, guess.too_long?
  end

  def test_can_format_guess_into_code_array
    user_entry = "rrgb"
    difficulty_entry = 4
    guess = Guess.new(user_entry, difficulty_entry)

    assert_equal %w(r r g b), guess.code_guess
  end

  def test_guess_can_quit
    user_entry = "q"
    difficulty_entry = 4
    guess = Guess.new(user_entry, difficulty_entry)

    assert_equal "You have exited the game", guess.quit_or_cheat
  end

  def test_guess_can_cheat
    user_entry = "c"
    difficulty_entry = 4
    guess = Guess.new(user_entry, difficulty_entry)

    turn = Turn.new(guess, %w(r r r r), difficulty_entry)

    assert_equal "Cheat code: '#{@secret_code}'", guess.quit_or_cheat
  end
end
