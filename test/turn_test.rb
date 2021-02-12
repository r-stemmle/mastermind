require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/guess'

class TurnTest < Minitest::Test
  def test_it_exists
    # skip
    secret_code = %w(r r r r)
    guess = Guess.new('rrgb')
    turn = Turn.new(guess, secret_code)

    assert_instance_of Turn, turn
  end

  def test_it_can_get_code_from_guess
    secret_code = %w(r r r r)
    guess = Guess.new('rrgb')
    turn = Turn.new(guess, secret_code)

    assert_equal ['r', 'r', 'g', 'b'], turn.code_guess
  end

  def test_it_can_have_secret_code
    secret_code = %w(r r r r)
    guess = Guess.new('rrgb')
    turn = Turn.new(guess, secret_code)

    assert_equal %w(r r r r), turn.secret_code
  end

  def test_codebreaker_can_guess_the_secret_code
    secret_code = %w(r r r r)
    guess = Guess.new('rrrr')
    turn = Turn.new(guess, secret_code)

    assert_equal true, turn.guessed_secret_code?
  end

  def test_codebreaker_can_not_guess_secret_code
    secret_code = %w(r r r r)
    guess = Guess.new('rrgb')
    turn = Turn.new(guess, secret_code)

    assert_equal false, turn.guessed_secret_code?
  end

  def test_it_can_provide_feedback_on_correct_colors # NEEDS ATTENTION
    skip
    secret_code = %w(r r g b)
    guess = Guess.new('rrry')
    turn = Turn.new(guess, secret_code)
    turn.find_key_colors

    assert_equal 2, turn.white_peg
  end

  def test_it_can_provide_feedback_on_correct_position
    secret_code = %w(r r g b)
    guess = Guess.new('rrry')
    turn = Turn.new(guess, secret_code)
    turn.find_key_colors

    assert_equal 2, turn.red_peg
  end

  def test_it_can_provide_feedback_on_correct_position_again
    secret_code = %w(r r g b)
    guess = Guess.new('rggb')
    turn = Turn.new(guess, secret_code)
    turn.find_key_colors

    assert_equal 3, turn.red_peg
  end
end
