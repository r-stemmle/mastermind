


class Game
  attr_reader :turn

  def initialize(turn)
    @turn = turn
    @start
  end

  def welcome
    puts "Welcome to MASTERMIND"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    puts ">"
    @start = $stdin.gets.chomp.downcase
    if @start == 'i'
      puts "You have four color code pegs to play in any combination for one given guess. Mastermind will provide feedback on the number of correct colors, and the number of correct positions."
    elsif @start == 'q' || @start == 'quit'
      puts "You have exited the game"
    elsif @start == 'p'
      play
    else
      welcome
    end
  end

  def play
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
    code_guess = $stdin.gets.chomp.downcase

  end
end



# generates random secret code

#play enters guess
  # if q, exit
  # if c, display secret code
  # if matches secret code, go to end_game

  # if too short/long, display message, get user guess again

  # if valid guess, compare to secret code and give feedback
  # insert guess_counter

  # increment guess_counter
  # repeat loop
