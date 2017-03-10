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

# Testing
if __FILE__ == $PROGRAM_NAME
  puts player = Core.new # start the engine
  puts player.secret # the secret number
  puts player.guess(50) # try the number 50
  puts player.tries # get the tries number
  puts player.time # get time left in seconds
end
