


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
