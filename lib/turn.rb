require './lib/game'

class Turn
  attr_accessor :guess,
                :code_guess,
                :secret_code,
                :all_possible_codes,
                :red_peg,
                :white_peg

  def initialize(guess, secret_code)
    @guess = guess
    @code_guess = @guess.code_guess
    @secret_code = secret_code
    @red_peg = 0
    @white_peg = 0

  end

  def find_key_colors
    # Red pegs computed below 23-26
    @red_peg = 0
    @code_guess.each_with_index do |color, index|
      if color == @secret_code[index]
        @red_peg += 1
      end
    end

    color_checker = []
    @code_guess.each do |letter|
      if @secret_code.include?(letter) && color_checker.include?(letter) == false
        @white_peg += 1
        color_checker << letter
      end
    end
  end

  def get_secret_code
    p @secret_code
  end

  def guessed_secret_code?
    @code_guess == @secret_code
  end
end
