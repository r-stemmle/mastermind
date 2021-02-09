# Require stuff

puts "Welcome to MASTERMIND"

puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
puts ">"
start = $stdin.gets.chomp.downcase
p start

puts "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"
code_guess = $stdin.gets.chomp.downcase
p code_guess 

"#{code_guess} has #{key_white} of the correct elements with #{key_red} in the correct positions
You've taken #{guess_counter} guess"


"Congratulations! You guessed the sequence #{secret_code.upcase} in #{guess_counter} guesses over #{game_minutes} minutes,
#{game_seconds} seconds.

Do you want to (p)lay again or (q)uit?"










# "They can then enter a guess in the form rrgb
#
# Guesses are case insensitive
# If it’s 'q' or 'quit' then exit the game
# If it’s 'c' or 'cheat' then print out the current secret code
# If it’s fewer than four letters, tell them it’s too short
# If it’s longer than four letters, tell them it’s too long
# If they guess the secret sequence, enter the end game flow below
# Otherwise give them feedback on the guess like this:
# 'RRGB' has 3 of the correct elements with 2 in the correct positions
# You've taken 1 guess
# Then let them guess again, repeating the game flow loop."
# get user input
# check if p, i, or q
# if q, exit
# if i, display instructions (here)
# if p, run game.rb
