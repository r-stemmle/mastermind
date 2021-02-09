class Turn
  attr_reader :guess

  def initialize(guess)
    @guess = guess
  end
  #turn would have player
  #turn would submit one guess
  #turn would provide feedback
  #turn would indicate a win
  # increment guess_counter
  # repeat loop
end


# array method to create all possibilities of game
# all_possible_codes = ["r", "g", "b", "y"].repeated_permutation(4).to_a
# p all_possible_codes.sample
