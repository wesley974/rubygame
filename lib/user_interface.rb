require 'core'
require 'scoreboard'
require 'terminal-table'
require 'colored'

# The user interface
class UserInterface
  SPACES = 50
  HEADER = ['Name', 'Attempts', 'Time!'].freeze
  def initialize
    @name = 'Guest'
    @board = Scoreboard.new
    welcome
    set_name
    view_score
    play
  end

  def show(title: nil, msg: nil)
    puts "\n\n#{title.center(SPACES).green.bold}" if title
    puts "#{msg.center(SPACES)}\n" if msg
  end

  def welcome
    show(title: '|Game : The magicians|')
    show(msg: "Find the number between 1 and #{Core::RANGE.max}")
    show(msg: "You can abandon with the command 'quit'")
  end

  def view_score
    show(msg: '- The Best 3 SCORE -')
    format_table(@board.info)
  end

  def format_table(datas)
    table = Terminal::Table.new headings: HEADER, rows: datas
    table.align_column(1, :center)
    table.align_column(2, :center)
    puts table.render.split("\n").map { |ln| ln.center(50) }.join("\n")
  end

  def set_name
    try_a_name = ask("\nEnter your name : ").capitalize
    @name = try_a_name unless try_a_name == 'Quit' || try_a_name.empty?
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

  def bybye
    puts "\nGoodbye #{@name}.\n\n"
    exit
  end

  def play
    @player = Core.new
    result = nil
    while result != :win
      result = @player.guess(ask_for_number)
      puts result
    end
    check_winner
  end

  def new_score
    puts ' New Score !!'.red.bold \
      if @board.add(@name, @player.tries, @player.time)
  end

  def check_winner
    puts "In #{@player.tries} attempts and in #{@player.time} seconds!\n"
    if @player.tries == 1
      puts "\n\n Wow, amazing !!!\nWe have found our magician ?!\n\n"
    else
      puts "\n We have a winner, #{@name}!"
    end
    new_score
  end
end
