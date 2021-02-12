require './lib/turn'
require './lib/guess'


class Game
  attr_reader :start, :input, :guess, :secret_code
  attr_accessor :turn

  def initialize
    @player
    @turn
    @start
    @input
    @guess
    @secret_code
    @all_possible_codes = ["r", "g", "b", "y"].repeated_permutation(4).to_a
  end

  def welcome
    puts "Welcome to MASTERMIND"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    puts ">"
    @start = $stdin.gets.chomp.downcase
    if @start == "q" || @start == "quit"
      quits_game
    elsif @start == "i"
      gives_instructions
    elsif @start == "p"
      self.play_message
      self.play
    end
  end

  def make_secret_code
    @secret_code = @all_possible_codes.sample
  end

  def play_message
    p "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
  end

  def play
    @input = $stdin.gets.chomp.downcase
    if @input == "q" || @input == "quit"
      quits_game
    elsif @input == "c" || @input == "cheat"
      p "Hey Cheater, heres your code: #{@secret_code.join().upcase}"
    else
      @guess = Guess.new(@input)
      @turn = Turn.new(@guess, @secret_code)
      self.get_pegs
    end
  end

  def get_pegs
    @turn.find_key_colors
    if @turn.red_peg == 4
      p "Winner"
    else
      p "'#{@turn.guess.guess}' has #{@turn.white_peg} of the correct elements with #{turn.red_peg} in the correct positions
      You've taken 1 guess"
      self.play
    end
  end

  def gives_instructions
    p "You have four color code pegs to play in any combination for one given guess. Mastermind will provide feedback on the number of correct colors, and the number of correct positions."
  end

  def quits_game
    p "You have exited the game"
  end
end
