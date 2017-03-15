require 'core'
require 'scoreboard'
require 'terminal-table'
require 'colored'
require 'format'
require 'system'

# The user interface
class UserInterface < System
  def initialize
    ctrlc_trap
    @name = 'Guest'
    @board = Scoreboard.new
    welcome
    set_name
    Format.table(@board.info)
    play
  end

  private

  def welcome
    Format.text(title: '|Game : The magicians|')
    Format.text(msg: "Find the number between 1 and #{Core::RANGE.max}")
    Format.text(msg: "You can escape with the command 'quit'")
  end

  def set_name
    try_a_name = ask("\nEnter your name [guest]: ").capitalize
    @name = try_a_name unless try_a_name.empty?
    puts
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

  def play
    countdown(5)
    @player = Core.new
    result = nil
    puts result = @player.guess(ask_for_number) until result == :win
    check_winner
  end

  def new_score
    puts ' New Score !!'.red.bold \
      if @board.add(@name, @player.tries, @rt)
    Format.table(@board.info, winner: [@rt, @name])
    press_any_key
    play
  end

  def check_winner
    info_user
    if @player.tries == 1
      puts ' We have found our magician ?!'.magenta_on_white
    else
      puts " We have a winner, #{@name}!"
    end
    new_score
  end

  def countdown(seconds)
    seconds.downto(1) do |s|
      print s.to_s.rjust(Format::SPACES / 2)
      sleep 1
      print "\r"
    end
    puts 'Beat the best time!'.center(Format::SPACES)
  end

  def info_user
    @rt = @player.time
    puts "#{@player.tries} attempts in " + @rt.to_s.red + " seconds!\n"
  end
end
