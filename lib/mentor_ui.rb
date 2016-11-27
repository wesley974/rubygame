require_relative 'mentor_core'
require_relative 'show'

# The user-interface
class User_interface
  def initialize
    Show.title
    Show.teaser

    @name = 'Guest'
    your_name
  end

  def your_name
    Show.name

    try_a_name = gets.chomp.capitalize
    @name = try_a_name unless try_a_name == 'Quit' || try_a_name.empty?
    bybye if try_a_name == 'Quit'

    Show.play
    play_game
  end

  def bybye
    puts "\nGoodbye #{@name}.\n\n"
    exit
  end

  def play_game
    number = gets.chomp.to_i
    try = Core.new
    try.guess(number)
  end

end

player = User_interface.new
