require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_peg.rb'

class KeyPegTest < Minitest::Test

  def test_it_exists
    key_peg = KeyPeg.new("red")

    assert_instance_of KeyPeg, key_peg
  end

  def test_it_has_attributes
    key_peg = KeyPeg.new("red")

    assert_equal "red", key_peg.color
  end 
end
