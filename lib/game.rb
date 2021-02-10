


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
      p "You have four color code pegs to play in any combination for one given guess. Mastermind will provide feedback on the number of correct colors, and the number of correct positions."
    elsif @start = 'q' || 'quit'
      p "You have exited the game"
    end
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
