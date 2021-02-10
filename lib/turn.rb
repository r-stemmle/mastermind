class Turn
  attr_accessor :guess, :code_guess, :secret_code, :all_possible_codes

  def initialize(guess)
    @guess = guess
    @code_guess = []
    @secret_code = []
    @all_possible_codes = ["r", "g", "b", "y"].repeated_permutation(4).to_a
  end

  def key_color
    (@secret_code & @code_guess).length
  end

  def make_secret_code
    @secret_code = all_possible_codes.sample
  end

  def get_code
    if @guess == 'q' || @guess == "quit"
      p "You have exited the game"
    elsif @guess == 'i'
      p "You have four color code pegs to play in any combination for one given guess. Mastermind will provide feedback on the number of correct colors, and the number of correct positions."
    elsif @guess == 'c' || @guess == "cheat"
      p "Cheat code: '#{@secret_code.join}'"
    else
      a = @guess.chars
      a.each do |letter|
        @code_guess << letter
      end
    end
  end

  def guessed_secret_code?
    @code_guess == @secret_code
  end

  def too_short?
    if @code_guess.length <= 3
      p "Your guess is too short"
    end
  end

  def too_long?
    if @code_guess.length >= 5
      p "Your guess is too long"
    end
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
# >>>>>>> c5ecc780e51f1ae8604011dac8aa6a5ba1a20fbc
