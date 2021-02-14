class Guess
  attr_reader :user_entry,
              :code_guess,
              :difficulty_level

  def initialize(user_entry, difficulty_level)
    @difficulty_level = difficulty_level
    @user_entry = user_entry
    @code_guess = []
    input = user_entry.chars
    input.each do |letter|
      @code_guess << letter
    end
  end

  def quit_or_cheat
    if @user_entry == "q" || @user_entry == "quit"
      p "You have exited the game"
    else @user_entry == "c" || @user_entry == "cheat"
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
