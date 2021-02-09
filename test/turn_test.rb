require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'

class TurnTest < Minitest::Test
  def test_it_exists
    turn = Turn.new('rrgb')

    assert_instance_of Turn, turn
  end

  def test_it_has_attributes
    turn = Turn.new('rrgb')

    assert_equal 'rrgb', turn.code_pegs
  end

  def test_it_can_have_different_attributes
  end

end
