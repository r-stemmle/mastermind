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

  def count_correct_positions
    color_index_checker = []
    @code_guess.each_with_index do |color, index|
      if color == @secret_code[index]
        @red_peg += 1
      end
    end
  end

  def count_correct_colors
    %w(b g r y).each do |color|
      if @code_guess.count(color) < @secret_code.count(color)
        @white_peg += @code_guess.count(color)
      else
        @white_peg += @secret_code.count(color)
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
