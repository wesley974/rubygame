# DEBUG : rubocop tool

require 'scoreboard'
require 'show'

# The game core
class CoreOld
  MAXNUM = 1_00 # 100

  def initialize
    # Generate the secret number and the tries number
    @secret = 1 + rand(MAXNUM)
    @tries = 0

    Show.title
    Show.teaser

    @name = 'Guest'
    your_name
  end

  def your_name
    Show.name

    # Get your name
    try_a_name = gets.chomp.capitalize
    @name = try_a_name unless try_a_name == 'Quit' || try_a_name.empty?
    byebye if try_a_name == 'Quit'

    Show.play
  end

  def show_time
    puts "\nTime left : #{(Time.now - @start_time).round} seconds\n"
  end

  def winner
    show_time
    Show.winner
    puts "#{@tries} tries, good job !\n\n"
    byebye
  end

  def big_winner
    show_time
    Show.big_winner
    byebye
  end

  def byebye
    puts "\nGoodbye #{@name}.\n\n"
    exit
  end

  def a_number?(answer)
    answer.to_s == answer.to_i.to_s
  end

  def ask_a_number
    Show.try
    answer = gets.chomp

    byebye if answer == 'quit'

    answer
  end

  def check(answer)
    @tries += 1

    Show.smaller if answer.to_i < @secret
    Show.bigger if answer.to_i > @secret

    a_winner?(answer)
  end

  def a_winner?(answer)
    return false unless answer.to_i == @secret
    @tries == 1 ? big_winner : winner
  end

  def play
    @start_time = Time.now
    answer = nil

    while answer != @secret
      answer = ask_a_number

      (Show.warn_number; redo) unless a_number?(answer)

      check(answer)
    end
  end
end
