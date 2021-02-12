require 'minitest/autorun'
require 'minitest/pride'
require './lib/player.rb'

class PlayerTest < Minitest::Test

  def test_it_exists
    player = Player.new("Joe")

    assert_instance_of Player, player
  end

  def test_it_has_attributes
    player = Player.new("Joe")

    assert_equal "Joe", player.name 
  end
end
