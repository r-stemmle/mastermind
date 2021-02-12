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

  def quit_or_cheat
    if @guess == "q" || @guess == "quit"
      p "You have exited the game"
    else @guess == "c" || @guess == "cheat"
      p "Cheat code: '#{@secret_code}'"
    end
  end

  def too_short?
    puts "Your guess is too short"
    @code_guess.length <= 3
  end

  def too_long?
    puts "Your guess is too long"
    @code_guess.length >= 5
  end

end
