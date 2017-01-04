# The game core engine
class Core
  RANGE = 1..100
  attr_reader :secret

  def initialize
    @secret = rand(RANGE)
    @statistics = { tries: 0, start_time: Time.now }
  end

  def guess(number)
    @statistics[:tries] += 1
    { -1 => :higher, 0 => :win, 1 => :lower }[number.to_i <=> @secret]
  end

  def tries
    @statistics[:tries]
  end

  def time
    Time.now - @statistics[:start_time]
  end
end

# Testing with irb
# --------------------------------------
# require_relative 'lib/core'
# player = Core.new => start the engine
# player.guess(50) => result
# player.secret => give the secret number!
# player.tries => get the tries number
# player.time => get time left in seconds
