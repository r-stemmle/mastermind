require 'minitest/autorun'
require 'minitest/pride'
require './lib/player.rb'

class WinnerTest < Minitest::Test

  def test_it_exists
    winner = Winner.new("Joe")

    assert_instance_of Winner, winner
  end

  def test_it_has_attributes
    winner = Winner.new("Joe")

    assert_equal "Joe", winner.name
  end
end
