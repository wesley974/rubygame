# The game engine
class GameEngine
  MAXNUM = 1_00 # 100
  def initialize
    @secret = 1 + rand(MAXNUM)
    @attempts = 0
    @start_time = Time.new
  end

  def a_number?(number)
    number.to_s == number.to_i.to_s
  end

  def guess(number)
    result = 'too big' if number.to_i > @secret
    result = 'too small' if number.to_i < @secret
    result = 'a winner' if number.to_i == @secret
    result = 'not a number' unless a_number?(number)
    @attempts += 1 if result != 'not a number'
    result
  end

  def tries
    @attempts
  end

  def time
    (Time.now - @start_time).round
  end
end

# player = GameEngine.new => start the engine
# player.guess(50) => guess
# player.tries => get the attempts number
# player.time => get time left in seconds
