require 'core'
require 'scoreboard'
require 'press_any_key'
require 'terminal-table'
require 'colored'

# The user interface
class UserInterface
  SPACES = 50
  HEADER = %w(Name Attempts Time!).freeze
  def initialize
    @name = 'Guest'
    @board = Scoreboard.new
    welcome
    set_name
    view_score
    play
  end

  def format(title: nil, msg: nil)
    puts "\n\n#{title.center(SPACES).green.bold}" if title
    puts "#{msg.center(SPACES)}\n" if msg
  end

  def welcome
    format(title: '|Game : The magicians|')
    format(msg: "Find the number between 1 and #{Core::RANGE.max}")
    format(msg: "You can abandon with the command 'quit'")
  end

  def view_score
    format(msg: '- The Best 3 SCORE -')
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
    @name = try_a_name unless try_a_name.empty?
  end

  def ask(question = 'Try? ')
    print question
    gets.chomp.tap { |input| bybye if input == 'quit' }
  end

  def a_number?(input)
    input.to_s == input.to_i.to_s
  end

  def ask_for_number
    number = ask
    number = ask("Please, a number.\nTry? ") until a_number?(number)
    number
  end

  def bybye
    puts "Goodbye #{@name}.\n\n"
    exit
  end

  def play
    countdown(5)
    @player = Core.new
    result = nil
    until result == :win
      result = @player.guess(ask_for_number)
      puts result
    end
    check_winner
  end

  def new_score
    puts ' New Score !!'.red.bold \
      if @board.add(@name, @player.tries, @player.time)
    PressAnyKey.new
    UserInterface.new
  end

  def check_winner
    puts "#{@player.tries} attempts in #{@player.time} seconds!\n"
    if @player.tries == 1
      puts ' We have found our magician ?!'
    else
      puts " We have a winner, #{@name}!"
    end
    new_score
  end

  def countdown(seconds)
    seconds.downto(1) do |s|
      print s.to_s.center(50)
      sleep 1
      print "\r"
    end
    puts 'Beat the best time!'.center(50)
  end
end
