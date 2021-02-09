require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_peg.rb'

class CodePegTest < Minitest::Test

  def test_it_exists
    spot1 = CodePeg.new("r")
    spot2 = CodePeg.new("r")
    spot3 = CodePeg.new("g")
    spot4 = CodePeg.new("b")

    assert_instance_of CodePeg, spot1
  end

  def test_it_has_attributes
    spot1 = CodePeg.new("r")

    assert_equal "r", spot1.color
  end
end
