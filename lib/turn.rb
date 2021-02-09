class Turn
  attr_reader :guess, :code_guess, :secret_code, :all_possible_codes

  def initialize(guess)
    @guess = guess
    @code_guess = []
    @secret_code = []
    @all_possible_codes = ["r", "g", "b", "y"].repeated_permutation(4).to_a
  end

  # def all_possible_codes
  #
  # end

  def make_secret_code
    @secret_code = all_possible_codes.sample
  end

  def get_code
    a = @guess.chars
    a.each do |letter|
      @code_guess << letter
    end
  end
  #turn would have player
  #turn would submit one guess
  #turn would provide feedback
  #turn would indicate a win
  # increment guess_counter
  # repeat loop
end
# <<<<<<< HEAD



# array method to create all possibilities of game
# all_possible_codes = ["r", "g", "b", "y"].repeated_permutation(4).to_a
# p all_possible_codes.sample
# >>>>>>> c5ecc780e51f1ae8604011dac8aa6a5ba1a20fbc
