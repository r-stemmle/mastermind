require './lib/game'
require './lib/player'
require './lib/turn'
require './lib/guess'

player = Player.new("Joe")
game = Game.new

game.welcome

if game.start == "p"
  game.play_message
  secret_code = game.make_secret_code
  # p secret_code
  game.play
  game.get_pegs
end




# "Congratulations! You guessed the sequence #{secret_code.upcase} in #{guess_counter} guesses over #{game_minutes} minutes,
# #{game_seconds} seconds.

# Do you want to (p)lay again or (q)uit?"
