# DEBUG
# require 'minitest/autorun'
# class Core < MiniTest::Test

require_relative 'score'

# The game core
class Core
  SPC = 50
  MAXNUM = 1_00 # 100

  def initialize
    @num = 1 + rand(MAXNUM)
    @try = 0

    show_title
  end

  def show_title
    title = '|Game : The magician|'

    puts "\n" + title.center(SPC)

    show_teaser
    your_name
  end

  def show_teaser
    teaser = "\sFind the number between 1 and #{MAXNUM}\s"
    quit_cmd = "\nYou can abandon with the command 'quit'.\n\n"

    puts teaser.center(SPC, '*') + "\n\n" + quit_cmd
  end

  def your_name
    print "\nEnter your name : "
    @name = gets.chomp.capitalize

    @name = 'Guest' if @name.empty?

    puts "Let's play!\n\n"
  end

  def show_time
    puts "\nTime left : #{(Time.now - @check_time).round} seconds\n"
  end

  def winner
    show_time

    puts "\n\nWe have a winner!\n"
    puts "#{@try} tries, good job !\n\n"

    byebye
  end

  def big_winner
    show_time

    puts "\n\nWow, amazing !!!\nWe have found our magician ?!\n\n"

    byebye
  end

  def byebye
    puts "\nGoodbye #{@name}.\n\n"

    exit
  end

  def a_number?(turn)
    turn.to_s == turn.to_i.to_s
  end

  def ask
    print 'Try ? '
    turn = gets.chomp

    byebye if turn == 'quit'

    return turn
  end

  def check(turn)
    @try += 1

    puts 'Too small!' if turn.to_i < @num
    puts 'Too Big!' if turn.to_i > @num
    a_winner?(turn)
  end

  def a_winner?(turn)
    if turn.to_i == @num
      @try == 1 ? big_winner : winner
    end
  end

  def play
    turn = nil
    @check_time = Time.now

    while turn != @num
      turn = ask

      (puts 'Please, a number !!!'; redo) unless a_number?(turn)

      check(turn)
    end
  end
end
