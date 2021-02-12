class Guess
  attr_reader :guess, :code_guess

  def initialize(guess)
    @guess = guess
    @code_guess = []
    input = guess.chars
    input.each do |letter|
      @code_guess << letter
    end
  end

  def get_code
    if @code_guess == "q" || @code_guess == 'quit'
      p "You have exited the game"
    else @code_guess == 'c' || @code_guess == "cheat"
      p "Cheat code: '#{@secret_code}'"
    end
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

end
