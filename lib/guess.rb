class Guess
  attr_reader :guess, :code_guess, :difficulty_level

  def initialize(guess, difficulty_level)
    @difficulty_level = difficulty_level
    @guess = guess
    @code_guess = []
    input = guess.chars
    input.each do |letter|
      @code_guess << letter
    end
  end

  def quit_or_cheat
    if @guess == "q" || @guess == "quit"
      p "You have exited the game"
    else @guess == "c" || @guess == "cheat"
      p "Cheat code: '#{@secret_code}'"
    end
  end

  def too_short?
    #beginner is 4, intermediate guess is 6, advanced is 8
    @code_guess.length < @difficulty_level
  end

  def too_long?
    @code_guess.length > @difficulty_level
  end

end
