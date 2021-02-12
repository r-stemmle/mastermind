require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess.rb'
require './lib/turn.rb'


class PlayerTest < Minitest::Test

  def test_it_exists
    input = "rrgb"
    guess = Guess.new(input)

    assert_instance_of Guess, guess
  end

  def test_it_has_attributes
    input = "rrgb"
    guess = Guess.new(input)

    assert_equal %w(r r g b), guess.code_guess
  end

  def test_if_guess_is_too_short
    input = "rrg"
    guess = Guess.new(input)

    assert_equal true, guess.too_short?
  end

  def test_if_guess_is_too_long
    input = "rrrrrrrrrrg"
    guess = Guess.new(input)

    assert_equal true, guess.too_long?
  end

  def test_can_format_guess_into_code_array
    input = "rrgb"
    guess = Guess.new(input)

    assert_equal %w(r r g b), guess.code_guess
  end

  def test_guess_can_quit
    input = "q"
    guess = Guess.new(input)

    assert_equal "You have exited the game", guess.quit_or_cheat
  end

  def test_guess_can_cheat
    input = "c"
    guess = Guess.new(input)
    turn = Turn.new(guess, %w(r r r r))

    assert_equal "Cheat code: '#{@secret_code}'", guess.quit_or_cheat
  end
end
