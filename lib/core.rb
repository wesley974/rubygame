# DEBUG
# require 'minitest/autorun'
# class Core < MiniTest::Test

require 'score'
require 'show'

# The game core
class Core
  # Declare constants
  SPC = 50
  MAXNUM = 1_00 # 100

  def initialize
    # Initialize the secret number and the try variable
    @num = 1 + rand(MAXNUM)
    @try = 0

    Show.title
    Show.teaser
    your_name
  end

  def your_name
    Show.name

    @name = gets.chomp.capitalize
    @name = 'Guest' if @name.empty?
    byebye if @name == 'Quit'

    Show.play
  end

  def show_time
    puts "\nTime left : #{(Time.now - @check_time).round} seconds\n"
  end

  def winner
    show_time

    Show.winner
    puts "#{@try} tries, good job !\n\n"

    byebye
  end

  def big_winner
    show_time

    Show.big_winner

    byebye
  end

  def byebye
    @name = 'Guest' if @name == 'Quit'
    puts "\nGoodbye #{@name}.\n\n"

    exit
  end

  def a_number?(turn)
    turn.to_s == turn.to_i.to_s
  end

  def ask
    Show.try
    turn = gets.chomp

    byebye if turn == 'quit'

    turn
  end

  def check(turn)
    @try += 1

    Show.smaller if turn.to_i < @num
    Show.bigger if turn.to_i > @num

    a_winner?(turn)
  end

  def a_winner?(turn)
    return false unless turn.to_i == @num
    @try == 1 ? big_winner : winner
  end

  def play
    turn = nil
    @check_time = Time.now

    while turn != @num
      turn = ask

      (Show.warn_number; redo) unless a_number?(turn)

      check(turn)
    end
  end
end
