# The game core engine
class Core
  RANGE = 1..100 # 1 to 100

  attr_reader :secret

  def initialize
    @secret = rand(RANGE)
    @statistics = {tries: 0, start_time: Time.now }
  end

  def guess(number)
    @statistics[:tries] += 1
    case number.to_i <=> @secret
    when -1 then :higher
    when 0 then :win # end of game flag
    when 1 then :lower
    end
  end

  def tries
    @statistics[:tries]
  end

  def time
    Time.now - @statistics[:start_time]
  end
end

# TEST With irb
# --------------------------------------
# require_relative 'lib/core'
# player = Core.new => start the engine
# player.guess(50) => result
# player.secret => give the secret number!
# player.tries => get the tries number
# player.time => get time left in seconds
