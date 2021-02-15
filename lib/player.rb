class Player
  attr_reader :name,
              :sequence,
              :guess_count,
              :play_time

  def initialize(name, sequence, guess_count, play_time)
    @name = name
    @sequence = sequence
    @guess_count = guess_count
    @play_time = play_time
  end
end
