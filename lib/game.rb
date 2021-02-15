require './lib/turn'
require './lib/guess'
require 'json'
require 'colorize'

class Game
  attr_reader :input,
              :guess,
              :secret_code,
              :guess_count,
              :start_time,
              :game_minutes,
              :game_seconds,
              :difficulty_level,
              :all_possible_codes

  attr_accessor :turn

  def initialize
    @player
    @turn
    @welcome_response
    @input
    @guess
    @secret_code
    @guess_count = 1
    @start_time
    @difficulty_level
    @all_possible_codes
  end

  def welcome
    system("clear")
    display_welcome_screen
    welcome_response
    if @welcome_response == "q" || @welcome_response == "quit"
      quits_game
    elsif @welcome_response == "i" || @welcome_response == "instructions"
      display_instruction_screen
    elsif @welcome_response == "p" || @welcome_response == "play"
      play_intro
    end
  end

  def play_intro
    set_difficulty_level
    set_all_possible_codes(@difficulty_level)
    @secret_code = make_secret_code
    @start_time = Time.now
    play_message
    play
  end

  def play
    @input = $stdin.gets.chomp.downcase
    if @input == "q" || @input == "quit"
      quits_game
    else
      @guess = Guess.new(@input, @difficulty_level)
      turns
    end
  end

  def turns
    @turn = Turn.new(@guess, @secret_code, @difficulty_level)
    if @input == "c" || @input == "cheat"
      puts "Hey Cheater, heres your code: '#{@secret_code.join().upcase}'".light_magenta.on_black
    elsif @guess.too_short?
      puts "Your guess is too short".yellow.on_black.blink
    elsif @guess.too_long?
      puts "Your guess is too long".yellow.on_black.blink
    end
    get_pegs
  end


  def get_pegs
    if @turn.code_guess == ["c"] || @turn.code_guess == ["cheat"]
      puts "What is your next guess".light_white.on_black
      play
    else
      find_key_colors
      if @turn.red_peg == @difficulty_level
        winner
      else
        feedback
      end
    end
  end

  def set_difficulty_level
    display_difficulty_level_screen
    @difficulty_level = $stdin.gets.chomp
    if @difficulty_level != "q"
      while @difficulty_level != "4" && @difficulty_level != "6" && @difficulty_level != "8" do
        puts "Try again!".yellow.on_black.blink
        self.set_difficulty_level
      end
    elsif @difficulty_level == "q"
        quits_game
        exit!
    end
  end

  def winner
    total_seconds_elapsed = (Time.now - @start_time).round(0)
    @game_minutes = ((total_seconds_elapsed % 3600) / 60).to_i
    @game_seconds = total_seconds_elapsed - (@game_minutes * 60)
    p "Congratulations! You've guessed the sequence! What's your name?"
    puts ""
    print ">"
    name = gets.chomp
    puts ""
    player = Player.new(name, @secret_code.join().upcase, @guess_count, (@game_minutes*60) + @game_seconds)
    player_object = {name: player.name, sequence: player.sequence, guess_count: player.guess_count, timer: player.play_time}
    #array with all historical number of guesses
    all_guess_count = []
    all_seconds_count = []
    #iteration to collect latest guess counts
    IO.foreach("winners.json") do |winner|
      each_hash = JSON.parse(winner)
      all_guess_count << each_hash["guess_count"]
      all_seconds_count << each_hash["timer"]
    end
    #sum of all guesses to prepare for finding average number of guesses
    guess_array_sum = all_guess_count.inject(0) { |sum, x| sum + x }
    @average_guesses = guess_array_sum / all_guess_count.length
    #sum of all seconds to prepare for finding average number of seconds
    seconds_array_sum = all_seconds_count.inject(0) { |sum, x| sum + x }
    @average_seconds = seconds_array_sum / all_seconds_count.length
    # adds each players data to winners.json
    File.open("winners.json", "a+") do |winner_info|
      winner_info.puts(player_object.to_json)
    end
    puts "#{player.name}, you guessed the sequence '#{@secret_code.join().upcase}' in #{@guess_count} guesses over #{@game_minutes} minutes, #{@game_seconds} seconds. That's #{time_comparer} and #{guess_comparer} than the average."
    puts ""
    top_ten
  end

  def top_ten
    puts "=== TOP 10 ==="
    ranking_array = []
    IO.foreach("winners.json") do |winner|
      winner_hash = JSON.parse(winner)
      ranking_array << winner_hash
    end
    b = ranking_array.sort_by do |hash|
      hash["guess_count"]
    end
    puts "1. #{b[0]["name"]} solved '#{b[0]["sequence"]}' in #{b[0]["guess_count"]} guesses over #{b[0]["timer"].divmod(60)[0]}m#{b[0]["timer"].divmod(60)[1]}s."
    puts "2. #{b[1]["name"]} solved '#{b[1]["sequence"]}' in #{b[1]["guess_count"]} guesses over #{b[1]["timer"].divmod(60)[0]}m#{b[1]["timer"].divmod(60)[1]}s."
    puts "3. #{b[2]["name"]} solved '#{b[2]["sequence"]}' in #{b[2]["guess_count"]} guesses over #{b[2]["timer"].divmod(60)[0]}m#{b[2]["timer"].divmod(60)[1]}s."
    puts "4. #{b[3]["name"]} solved '#{b[3]["sequence"]}' in #{b[3]["guess_count"]} guesses over #{b[3]["timer"].divmod(60)[0]}m#{b[3]["timer"].divmod(60)[1]}s."
    puts "5. #{b[4]["name"]} solved '#{b[4]["sequence"]}' in #{b[4]["guess_count"]} guesses over #{b[4]["timer"].divmod(60)[0]}m#{b[4]["timer"].divmod(60)[1]}s."
    puts "6. #{b[5]["name"]} solved '#{b[5]["sequence"]}' in #{b[5]["guess_count"]} guesses over #{b[5]["timer"].divmod(60)[0]}m#{b[5]["timer"].divmod(60)[1]}s."
    puts "7. #{b[6]["name"]} solved '#{b[6]["sequence"]}' in #{b[6]["guess_count"]} guesses over #{b[6]["timer"].divmod(60)[0]}m#{b[6]["timer"].divmod(60)[1]}s."
    puts "8. #{b[7]["name"]} solved '#{b[7]["sequence"]}' in #{b[7]["guess_count"]} guesses over #{b[7]["timer"].divmod(60)[0]}m#{b[7]["timer"].divmod(60)[1]}s."
    puts "9. #{b[8]["name"]} solved '#{b[8]["sequence"]}' in #{b[8]["guess_count"]} guesses over #{b[8]["timer"].divmod(60)[0]}m#{b[8]["timer"].divmod(60)[1]}s."
    puts "10. #{b[9]["name"]} solved '#{b[9]["sequence"]}' in #{b[9]["guess_count"]} guesses over #{b[9]["timer"].divmod(60)[0]}m#{b[9]["timer"].divmod(60)[1]}s."
  end

  def time_comparer
    if ((@game_minutes*60) + @game_seconds) > @average_seconds
      bummer = (((@game_minutes*60) + @game_seconds) - @average_seconds).divmod(60)
      "#{bummer[0]} minutes, #{bummer[1]} seconds slower"
    elsif ((@game_minutes*60) + @game_seconds) < @average_seconds
      bummer = (@average_seconds - ((@game_minutes*60) + @game_seconds)).divmod(60)
      "#{bummer[0]} minutes, #{bummer[1]} seconds faster"
    else
      "same amount of time"
    end
  end

  def guess_comparer
    if @guess_count > @average_guesses
      "#{@guess_count - @average_guesses} guesses more"
    elsif @guess_count < @average_guesses
      "#{@average_guesses - @guess_count} guesses fewer"
    else
      "no different"
    end
  end

  def play_message
    express_difficulty_in_string
    puts "CODEBREAKER, you have chosen the ".light_white.on_black + express_difficulty_in_string + ". The CODEMAKER has constructed a secret sequence with #{difficulty_level} elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow#{intermediate_color} #{advanced_color}.

    Use (q)uit at any time to end the game.

    What is your first your guess?".light_white.on_black
  end

  def long_instructions
    puts "===".light_white.on_black * 60
    puts "
    Mastermind is a code-breaking game.

    The computer is the CODEMAKER and generates a SECRET CODE at the start of the game.

    As the CODEBREAKER, you have 4, 6, or 8 (depending on selected difficulty level) color elements to play in any combination for each guess. Duplicates are allowed.

    After each guess, the CODEMAKER will give feedback on the number of correct colors, and the number of correct positions on the elements in your guess.

    Try to uncover the SECRET CODE in the fewest guesses and shortest time.
    ".light_white.on_black
    puts "===".light_white.on_black * 60
  end

  def display_instruction_screen
    long_instructions
    puts "Enter (p)lay to return to the start screen".white.on_black
    continue = $stdin.gets.chomp.downcase
    while continue != "p" && continue != "play" do
      system("clear")
      long_instructions
      puts "Please enter (p)lay to return to the start screen".yellow.blink
      continue = $stdin.gets.chomp.downcase
    end
    system("clear")
    welcome
  end

  def feedback
    puts " '#{@turn.guess.user_entry.upcase}' has #{@turn.white_peg} of the correct elements with #{turn.red_peg} in the correct positions.  You've taken #{@guess_count} guess(es)".light_white.on_black
    @guess_count += 1
    play
  end

  def quits_game
    puts "You have exited the game".light_white.on_black
  end

  def find_key_colors
    @turn.count_correct_positions
    @turn.count_correct_colors
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
    @difficulty_level = @difficulty_level.to_i
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

  def welcome_response
    @welcome_response = $stdin.gets.chomp.downcase
  end

  def express_difficulty_in_string
    difficulty_in_words = ""
    if @difficulty_level == 4
      difficulty_in_words = "beginner level".green.on_black
    elsif @difficulty_level == 6
      difficulty_in_words = "intermediate level".yellow.on_black
    else
      difficulty_in_words = "advanced level".red.on_black
    end
  end

  def display_welcome_screen
    puts "
        ███╗   ███╗ █████╗ ███████╗████████╗███████╗██████╗
        ████╗ ████║██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗
        ██╔████╔██║███████║███████╗   ██║   █████╗  ██████╔╝
        ██║╚██╔╝██║██╔══██║╚════██║   ██║   ██╔══╝  ██╔══██╗
        ██║ ╚═╝ ██║██║  ██║███████║   ██║   ███████╗██║  ██║
        ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝

        ███╗   ███╗██╗███╗   ██╗██████╗
        ████╗ ████║██║████╗  ██║██╔══██╗
        ██╔████╔██║██║██╔██╗ ██║██║  ██║
        ██║╚██╔╝██║██║██║╚██╗██║██║  ██║
        ██║ ╚═╝ ██║██║██║ ╚████║██████╔╝
        ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝

        Welcome to MASTERMIND

        Would you like to (p)lay, read the (i)nstructions, or (q)uit?
        >".light_white.on_black
  end

  def display_difficulty_level_screen
    system("clear")
    puts "===".light_white.on_black * 60
    puts "

    █─▄▄▄▄█▄─▄▄─█▄─▄███▄─▄▄─█─▄▄▄─█─▄─▄─███▄─▄▄▀█▄─▄█▄─▄▄─█▄─▄▄─█▄─▄█─▄▄▄─█▄─██─▄█▄─▄███─▄─▄─█▄─█─▄█
    █▄▄▄▄─██─▄█▀██─██▀██─▄█▀█─███▀███─██████─██─██─███─▄████─▄████─██─███▀██─██─███─██▀███─████▄─▄██
    ▀▄▄▄▄▄▀▄▄▄▄▄▀▄▄▄▄▄▀▄▄▄▄▄▀▄▄▄▄▄▀▀▄▄▄▀▀▀▀▄▄▄▄▀▀▄▄▄▀▄▄▄▀▀▀▄▄▄▀▀▀▄▄▄▀▄▄▄▄▄▀▀▄▄▄▄▀▀▄▄▄▄▄▀▀▄▄▄▀▀▀▄▄▄▀▀

    █▄─▄███▄─▄▄─█▄─█─▄█▄─▄▄─█▄─▄███
    ██─██▀██─▄█▀██▄▀▄███─▄█▀██─██▀█
    ▀▄▄▄▄▄▀▄▄▄▄▄▀▀▀▄▀▀▀▄▄▄▄▄▀▄▄▄▄▄▀

    Choose a difficulty level:
                          Beginner =     4 characters, 4 colors (enter: '4')
                          Intermediate = 6 characters, 5 colors (enter: '6')
                          Advanced =     8 characters, 6 colors (enter: '8')
                          ".light_white.on_black
    puts "===".light_white.on_black * 60
  end

  def win_message
    secret_code_in_words = (@secret_code.join().upcase).yellow.on_black
    guess_count_in_words = (@guess_count.to_s).light_green.on_black
    game_minutes_in_words = (game_minutes.to_s).light_green.on_black
    game_seconds_in_words = (game_seconds.to_s).light_green.on_black
    puts "
░██╗░░░░░░░██╗███████╗██╗░░░░░██╗░░░░░  ██████╗░░█████╗░███╗░░██╗███████╗░░░
░██║░░██╗░░██║██╔════╝██║░░░░░██║░░░░░  ██╔══██╗██╔══██╗████╗░██║██╔════╝░░░
░╚██╗████╗██╔╝█████╗░░██║░░░░░██║░░░░░  ██║░░██║██║░░██║██╔██╗██║█████╗░░░░░
░░████╔═████║░██╔══╝░░██║░░░░░██║░░░░░  ██║░░██║██║░░██║██║╚████║██╔══╝░░░░░
░░╚██╔╝░╚██╔╝░███████╗███████╗███████╗  ██████╔╝╚█████╔╝██║░╚███║███████╗██╗
░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝╚══════╝  ╚═════╝░░╚════╝░╚═╝░░╚══╝╚══════╝╚═╝

 ".light_white.on_black
    puts "Congratulations CODEBREAKER! You uncovered the secret sequence '#{secret_code_in_words}' in #{guess_count_in_words} guesses over #{game_minutes_in_words} minutes, #{game_seconds_in_words} seconds.
     ".light_white.on_black
  end
end
