require 'core'
require 'scoreboard'

# The user interface
class UserInterface
  SPACES = 50
  def initialize
    @name = 'guest'
    title
    teaser
    set_name
    play
  end

  def title
    title = '|Game : The magician|'
    puts "\n #{title.center(SPACES)}"
  end

  def teaser
    teaser = "\sFind the number between 1 and #{Core::RANGE}\s"
    quit = "\nYou can abandon with the command 'quit'.\n\n"
    puts "#{teaser.center(SPACES, '*')} \n\n #{quit}"
  end

  def set_name
    print "\nEnter your name :\s"
    try_a_name = gets.chomp.capitalize
    @name = try_a_name unless try_a_name == 'Quit' || try_a_name.empty?
    bybye if try_a_name == 'Quit'
    puts "Let's play!\n\n"
  end

  def ask
    answer = nil
    while a_number?(answer) != true
      print "Try?\s"
      answer = gets.chomp
      bybye if answer == 'quit'
      puts 'Please, a number.' unless a_number?(answer)
    end
    answer
  end

  def a_number?(number)
    number.to_s == number.to_i.to_s
  end

  def warn_number
    puts 'Please, a number !!!'
  end

  def winner
    puts "\n We have a winner, #{@name}!"
  end

  def big_winner
    puts "\n\nWow, amazing !!!\nWe have found our magician ?!\n\n"
  end

  def bybye
    puts "\nGoodbye #{@name}.\n\n"
    exit
  end

  def play
    player = Core.new
    result = nil
    while result != 'a winner'
      result = player.guess(ask)
      puts result
    end
    check_winner(player.tries, player.time)
  end

  def check_winner(tries, time)
    tries == 1 ? big_winner : winner
    puts "\s In #{tries} attempts and in #{time} seconds!\n\n"
  end
end
