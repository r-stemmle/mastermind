require 'minitest/autorun'
require 'minitest/pride'
require './lib/winner'

class WinnerTest < Minitest::Test

  def test_it_exists
    winner = Winner.new("Joe", "rrgb", 16, 134)

    assert_instance_of Winner, winner
  end

  def test_it_has_attributes
    winner = Winner.new("Joe", "rrgb", 16, 134)

    assert_equal "Joe", winner.name
    assert_equal "rrgb", winner.sequence
    assert_equal 16, winner.guess_count
    assert_equal 134, winner.play_time
  end

end
