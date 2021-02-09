require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require 'pry'

class TurnTest < Minitest::Test
  def test_it_exists
    spot1 = 'r'
    spot2 = 'r'
    spot3 = 'g'
    spot4 = 'b'
    code = [spot1, spot2, spot3, spot4]
    turn = Turn.new(code)

    assert_instance_of Turn, turn
  end

  def test_it_can_get_code_from_guess
    guess = 'rrgb'
    turn = Turn.new(guess)
    turn.get_code

    assert_equal ['r', 'r', 'g', 'b'], turn.code_guess
  end

  def test_it_can_have_secret_code
    guess = 'rrgb'
    turn = Turn.new(guess)
    turn.make_secret_code

    assert true, turn.all_possible_codes.include?(@secret_code)
  end

  def test_codebreaker_can_guess_the_secret_code
    guess = 'rrgb'
    turn = Turn.new(guess)
    turn.get_code
    turn.secret_code = %w(r r g b)

    assert_equal true, turn.guessed_secret_code?
  end

  def test_codebreaker_can_not_guess_secret_code
    guess = 'rrgb'
    turn = Turn.new(guess)
    turn.get_code
    turn.secret_code = %w(y r g b)

    assert_equal false, turn.guessed_secret_code?
  end

  def test_codebreaker_guess_too_short
    guess = 'rrg'
    turn = Turn.new(guess)
    turn.get_code
    turn.secret_code = %w(y r g b)
    turn.guessed_secret_code?

    assert_equal "Your guess is too short", turn.too_short?
  end

  def test_codebreaker_guess_too_long
    guess = 'rrgbb'
    turn = Turn.new(guess)
    turn.get_code
    turn.secret_code = %w(y r g b)
    turn.guessed_secret_code?

    assert_equal "Your guess is too long", turn.too_long?
  end

  def test_if_codebreaker_enters_q_game_exits
    guess = 'q'
    turn = Turn.new(guess)

    assert_equal "You have exited the game", turn.get_code
  end

  def test_if_codebreaker_enters_i_game_presents_instructions
    guess = 'i'
    turn = Turn.new(guess)

    assert_equal "You have four color code pegs to play in any combination for one given guess. Mastermind will provide feedback on the number of correct colors, and the number of correct positions.", turn.get_code
  end
end
