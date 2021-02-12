require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/guess'
require 'pry'

class TurnTest < Minitest::Test
  def test_it_exists
    # skip
    guess = Guess.new('rrgb')
    turn = Turn.new(guess)

    assert_instance_of Turn, turn
  end

  def test_it_can_get_code_from_guess
    # skip
    guess = Guess.new('rrgb')
    turn = Turn.new(guess)


    assert_equal ['r', 'r', 'g', 'b'], turn.code_guess
  end

  def test_it_can_have_secret_code
    # skip
    guess = Guess.new('rrgb')
    turn = Turn.new(guess)
    turn.make_secret_code

    assert true, turn.all_possible_codes.include?(@secret_code)
  end

  def test_codebreaker_can_guess_the_secret_code
    # skip
    guess = Guess.new('rrgb')
    turn = Turn.new(guess)
    turn.secret_code = %w(r r g b)

    assert_equal true, turn.guessed_secret_code?
  end

  def test_codebreaker_can_not_guess_secret_code
    # skip
    guess = Guess.new('yrgb')
    turn = Turn.new(guess)
    turn.secret_code = %w(r r g b)

    assert_equal false, turn.guessed_secret_code?
  end

  def test_codebreaker_guess_too_short
    # skip
    guess = Guess.new('rgb')
    turn = Turn.new(guess)
    turn.secret_code = %w(y r g b)


    assert_equal "Your guess is too short", guess.too_short?
  end

  def test_codebreaker_guess_too_long
    # skip
    guess = Guess.new('rrrgb')
    turn = Turn.new(guess)
    turn.secret_code = %w(y r g b)

    assert_equal "Your guess is too long", guess.too_long?
  end

  def test_if_codebreaker_enters_q_game_exits
    skip
    guess = Guess.new('q')
    turn = Turn.new(guess)
    turn.make_secret_code
# require "pry"; binding.pry
    assert_equal "You have exited the game", turn.guess.get_code
  end

  def test_if_codebreaker_enters_i_game_presents_instructions
    skip
    guess = 'i'
    turn = Turn.new(guess)

    assert_equal "You have four color code pegs to play in any combination for one given guess. Mastermind will provide feedback on the number of correct colors, and the number of correct positions.", turn.get_code
  end

  def test_it_can_print_current_secret_code_with_c
    skip
    guess = Guess.new('c')
    turn = Turn.new(guess)
    turn.secret_code = %w(y r g b)
# require "pry"; binding.pry
    assert_equal "Cheat code: 'yrgb'", turn.get_secret_code
  end

  def test_it_can_provide_feedback_on_correct_colors
    # skip
    guess = Guess.new('rrgb')
    turn = Turn.new(guess)
    turn.secret_code = %w(y r b r)
    turn.find_key_colors
# require "pry"; binding.pry
    assert_equal 3, turn.white_peg
  end

  def test_it_can_provide_feedback_on_correct_position
    # skip
    guess = Guess.new('rrgb')
    turn = Turn.new(guess)
    turn.secret_code = %w(y r b r)
    turn.find_key_colors

    assert_equal 1, turn.red_peg
  end

  def test_it_can_provide_feedback_on_correct_position
    # skip
    guess = Guess.new('rrbb')
    turn = Turn.new(guess)
    turn.secret_code = %w(y y g r)
    turn.find_key_colors

    assert_equal 0, turn.red_peg
  end
end
