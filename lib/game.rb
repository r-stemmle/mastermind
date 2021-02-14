require './lib/turn'
require './lib/guess'


class Game
  attr_reader :start,
              :input,
              :guess,
              :secret_code,
              :guess_count,
              :start_time,
              :difficulty_level,
              :all_possible_codes

  attr_accessor :turn

  def initialize
    @player
    @turn
    @start
    @input
    @guess
    @secret_code
    @guess_count = 1
    @start_time
    @difficulty_level
    @all_possible_codes
  end

  def welcome
    puts "Welcome to MASTERMIND"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    puts ">"
    @start = $stdin.gets.chomp.downcase    # helper method lines 23-31?
    if @start == "q" || @start == "quit"
      quits_game
    elsif @start == "i" || @start == "instructions"
      gives_instructions
    elsif @start == "p" || @start == "play"
      set_difficulty_level
      set_all_possible_codes(@difficulty_level)
      @secret_code = make_secret_code
      @start_time = Time.now
      self.play_message
      self.play
    end
  end



  def play_message
    p "You have chosen the #{difficulty_level}. Mastermind has constructed a secret sequence with #{difficulty_level} elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow#{intermediate_color} #{advanced_color} Use (q)uit at any time to end the game.  What's your guess?"
  end

  def play
    @input = $stdin.gets.chomp.downcase
    if @input == "q" || @input == "quit"
      quits_game
    else
      @guess = Guess.new(@input, @difficulty_level)
      @turn = Turn.new(@guess, @secret_code, @difficulty_level)
      if @input == "c" || @input == "cheat"
        p "Hey Cheater, heres your code: '#{@secret_code.join().upcase}'  "
      elsif @guess.too_short?
        puts "Your guess is too short"
      elsif @guess.too_long?
        puts "Your guess is too long"
      end
      self.get_pegs
    end
  end

  def get_pegs
    if @turn.code_guess == ["c"] || @turn.code_guess == ["cheat"]
      self.play_message
      self.play
    else
      find_key_colors
      if @turn.red_peg == @difficulty_level
        total_seconds_elapsed = (Time.now - @start_time).round(0)
        game_minutes = ((total_seconds_elapsed % 3600) / 60).to_i
        game_seconds = total_seconds_elapsed - (game_minutes * 60)
        p "Congratulations! You guessed the sequence '#{@secret_code.join().upcase}' in #{@guess_count} guesses over #{game_minutes} minutes, #{game_seconds} seconds."
      else
        p " '#{@turn.guess.user_entry.upcase}' has #{@turn.white_peg} of the correct elements with #{turn.red_peg} in the correct positions.  You've taken #{@guess_count} guess(es)"
        @guess_count += 1
        self.play
      end
    end
  end

  def gives_instructions
    p "You have 4, 6, or 8 (depending on selected difficulty level) color coded pegs to play in any combination for one given guess. Mastermind will provide feedback on the number of correct colors, and the number of correct positions."
    puts "===" * 20
    self.welcome
  end

  def quits_game
    p "You have exited the game"
  end

  def find_key_colors
    @turn.count_correct_positions
    @turn.count_correct_colors
  end

  def set_difficulty_level
    puts "Please choose a difficulty level: Beginner = 4 characters (use: 4), 4 colors, Intermediate = 6 characters, 5 colors (use: 6), Advanced = 8 characters, 6 colors (use: 8)"
    @difficulty_level = $stdin.gets.chomp.downcase.to_i
  end

  def intermediate_color
    if @difficulty_level == 6
      "(o)range."
    end
  end

  def advanced_color
    if @difficulty_level == 8
      ", (o)range, (v)iolet."
    end
  end

  def set_all_possible_codes(difficulty_level)
    if @difficulty_level == 4
      @all_possible_codes = ["r", "g", "b", "y"].repeated_permutation(4).to_a
    elsif @difficulty_level == 6
      @all_possible_codes = ["r", "g", "b", "y", "o"].repeated_permutation(6).to_a
    elsif @difficulty_level == 8
      @all_possible_codes = ["r", "g", "b", "y", "o", "v"].repeated_permutation(8).to_a
    end
  end

  def make_secret_code
    @secret_code = @all_possible_codes.sample
  end
end
