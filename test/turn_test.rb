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

  def test_it_has_attributes
    guess = 'rrgb'
    # spot1 = 'r'
    # spot2 = 'r'
    # spot3 = 'g'
    # spot4 = 'b'

    turn = Turn.new(guess)
    turn.get_code

    assert_equal ['r', 'r', 'g', 'b'], turn.code_guess
  end

  def test_it_can_have_different_attributes

  end

end
