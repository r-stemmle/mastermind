require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/guess'

class TurnTest < Minitest::Test
  def test_it_exists
    # skip
    secret_code = %w(r r r r)
    guess = Guess.new('rrgb', 4) # Integer 4 is a hard-coded difficulty level. It is tested in game_test.rb
    turn = Turn.new(guess, secret_code, 4)

    assert_instance_of Turn, turn
  end

  def test_it_can_get_code_from_guess
    secret_code = %w(r r r r)
    guess = Guess.new('rrgb', 4)
    turn = Turn.new(guess, secret_code, 4)

    assert_equal ['r', 'r', 'g', 'b'], turn.code_guess
  end

  def test_it_can_have_secret_code
    secret_code = %w(r r r r)
    guess = Guess.new('rrgb', 4)
    turn = Turn.new(guess, secret_code, 4)

    assert_equal %w(r r r r), turn.secret_code
  end

  def test_codebreaker_can_guess_the_secret_code
    secret_code = %w(r r r r)
    guess = Guess.new('rrrr', 4)
    turn = Turn.new(guess, secret_code, 4)

    assert_equal true, turn.guessed_secret_code?
  end

  def test_codebreaker_can_not_guess_secret_code
    secret_code = %w(r r r r)
    guess = Guess.new('rrgb', 4)
    turn = Turn.new(guess, secret_code, 4)

    assert_equal false, turn.guessed_secret_code?
  end

  def test_it_can_provide_feedback_on_correct_colors
    secret_code = %w(r r g b)
    guess = Guess.new('rrry', 4)
    turn = Turn.new(guess, secret_code, 4)
    turn.count_correct_colors

    assert_equal 2, turn.white_peg
  end

  def test_it_can_provide_feedback_on_correct_position
    secret_code = %w(r r g b)
    guess = Guess.new('rrry', 4)
    turn = Turn.new(guess, secret_code, 4)
    turn.count_correct_positions

    assert_equal 2, turn.red_peg
  end

  def test_it_can_provide_feedback_on_correct_position_again
    secret_code = %w(r r g b)
    guess = Guess.new('rggb', 4)
    turn = Turn.new(guess, secret_code, 4)
    turn.count_correct_positions

    assert_equal 3, turn.red_peg
  end
end
