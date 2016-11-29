# The game core engine
class Core
  RANGE = 1..1_00 # 1 to 100
  def initialize
    @secret = rand(RANGE)
    @tries = 0
    @start_time = Time.new
  end

  # def secret
  #  @secret
  # end
  attr_reader :secret

  def guess(number)
    @tries += 1
    result = 'too big' if number.to_i > @secret
    result = 'too small' if number.to_i < @secret
    result = 'a winner' if number.to_i == @secret
    # a_number?(number) ? @attempts += 1 : result = 'not a number'
    result
  end

  attr_reader :tries

  def time
    (Time.now - @start_time).round
  end
end

# Debug with : rubocop lib/core.rb

# TEST With irb
# --------------------------------------
# require_relative 'lib/core'
# player = Core.new => start the engine
# player.guess(50) => result
# player.secret => give the secret number!
# player.tries => get the tries number
# player.time => get time left in seconds
