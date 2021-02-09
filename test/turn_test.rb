require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'

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
    spot1 = 'r'
    spot2 = 'r'
    spot3 = 'g'
    spot4 = 'b'
    guess = [spot1, spot2, spot3, spot4]
    turn = Turn.new(guess)

    assert_equal ['r', 'r', 'g', 'b'], turn.guess
  end

  def test_it_can_have_different_attributes

  end

end
