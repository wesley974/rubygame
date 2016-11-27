# Debug the core game
class Debug
  def initialize
    @secret = 50
  end

  def check(tries)
    case
    when @answer < @secret then 'Too small!'
    when @answer > @secret then 'Too big!'
    when (@answer == @secret) && (tries == 1) then the_magician
    else "A winner in #{tries} tries!"
    end
  end

  def play
    @answer = nil
    tries = 0

    while @answer != @secret
      tries += 1
      print 'number ?'
      @answer = gets.chomp.to_i

      puts check(tries)
    end
  end

  def the_magician
    puts "\nWe have found our magician ?!\n\n"
  end
end

player = Debug.new
player.play
