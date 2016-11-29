# The game core engine
class Core
  RANGE = 1..1_00 # 1 to 100
  def initialize
    @secret = rand(RANGE)
    @attempts = 0
    @start_time = Time.new
  end

  def cheat
    @secret
  end

  #def a_number?(number)
  #  number.to_s == number.to_i.to_s
  #end

  def guess(number)
    result = 'too big' if number.to_i > @secret
    result = 'too small' if number.to_i < @secret
    result = 'a winner' if number.to_i == @secret
    #a_number?(number) ? @attempts += 1 : result = 'not a number'
    result
  end

  def tries
    @attempts
  end

  def time
    (Time.now - @start_time).round
  end
end

# TEST With irb
# --------------------------------------
# require_relative 'core'
# player = Core.new => start the engine
# player.guess(50) => result
# player.cheat => give the secret number!
# player.tries => get the attempts number
# player.time => get time left in seconds
