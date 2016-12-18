# The game core engine
class Core
  RANGE = 1..100 # 1 to 100

  private

  attr_reader :secret

  public

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

# TEST With irb (Really using rubydoctest gem)
# --------------------------------------
# doctest: Setup
# >> require './lib/core'
# >> Random.srand(1)
# >> player = Core.new
# doctest: secret returns the number
# >> player.send(:secret)
# => 38
# doctest: guess a number that is too high
# >> player.guess(50)
# => :lower
# doctest: guess a number that is too low
# >> player.guess(25)
# => :higher
# doctest: Guess the winning number
# >> player.guess(38)
# => :win
# doctest: Winning statistics
# >> player.tries
# => 3
# doctest: winning time as float
# >> player.time.class
# => Float
