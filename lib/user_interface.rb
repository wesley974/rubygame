require 'core'
require 'scoreboard'

# The user interface
class UserInterface
  SPACES = 50
  def initialize
    @name = 'guest'
    show(title: '|Game : The magicians|')
    show(msg: "Find the number between 1 and #{Core::RANGE.max}")
    show(msg: "You can abandon with the command 'quit'")
    set_name
    view_score
    play
  end

  def view_score
    score = Scoreboard.new
    Scoreboard.error_io unless score.check_file?
    show(msg: '- The Best 3 SCORE -') if score.count > 0
    score.view
  end

  def show(title: nil, msg: nil)
    puts "\n\n#{title.center(SPACES)}" if title
    puts "#{msg.center(SPACES)}\n" if msg
  end

  def set_name
    try_a_name = ask("\nEnter your name : ").capitalize
    @name = try_a_name unless try_a_name == 'Quit' || try_a_name.empty?
    puts "Try to be the first !\n\n"
  end

  def ask(whatitis = 'Try? ')
    print whatitis
    gets.chomp.tap { |input| bybye if input == 'quit' }
  end

  def a_number?(input)
    input.to_s == input.to_i.to_s
  end

  def ask_for_number
    num = ask
    num = ask("Please, a number.\nTry? ") until a_number?(num)
    num
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
    @player = Core.new
    result = nil
    while result != 'a winner'
      result = @player.guess(ask_for_number)
      puts result
    end
    check_winner
  end

  def check_winner
    @player.tries == 1 ? big_winner : winner
    puts "\s In #{@player.tries} attempts and in #{@player.time} seconds!\n\n"
  end
end
