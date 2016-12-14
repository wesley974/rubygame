# The game core engine
class Core
  RANGE = 1..1_00 # 1 to 100

  # def secret
  #  @secret
  # end
  attr_reader :secret

  def initialize
    @secret = rand(RANGE)
    @tries = 0
    @start_time = Time.new
  end

  def guess(number)
    @tries += 1
    case number.to_i <=> @secret
    when -1 then :less
    when 0 then :win
    when 1 then :big
    end
  end

  attr_reader :tries

  def time
    (Time.now - @start_time).round
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
