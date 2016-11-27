# The core game
class Core
  MAXNUM = 1_00 # 100

  def initialize
    @secret = 1 + rand(MAXNUM)
    @attempts = 0
  end

  def guess(number)
    @attempts += 1

    result = 'too big' if number.to_i > @secret
    result = 'too small' if number.to_i < @secret
    result = 'a winner' if number.to_i == @secret

    result
  end
end

# player = Core.new
# player.guess(50)
