#!/usr/bin/env ruby

# Last changes : 2016/11/02

# DEBUG
#require 'minitest/autorun'
#class Game < MiniTest::Test

class Game

  SPC = 50

  def initialize
    @maxnum = 100
    @num = 1 + rand(@maxnum)
    @try = 0
    show_title
  end

  def show_title
    title = "|Game : The magician|"
    puts "\n" + title.center(SPC)
    show_teaser
  end

  def show_teaser
    teaser = "\sFind the number between 1 and #{@maxnum}\s"
    quit_cmd = "\nYou can abandon with the command 'quit'.\n\n"
    puts teaser.center(SPC,"*") + "\n\n" + quit_cmd
  end

  def show_time
    puts "\nTime left : #{(Time.now - @check_time).round} secondes\n"
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
    puts "\nGoodbye.\n\n"
    exit
  end

  def is_a_number?(turn)
    turn.to_s == turn.to_i.to_s
  end

  def ask
    print "Try ? "
    turn = gets.chomp
    if turn == "quit" then byebye end
    return turn
  end

  def check(turn)
    @try += 1
    big_winner if turn.to_i == @num && @try == 1
    winner if turn.to_i == @num
    turn.to_i < @num ? (puts "Too small!") : (puts "Too BIG!")
  end

  def run
    turn = nil
    @check_time = Time.now
    while turn != @num
      turn = ask
      (puts "Please, a number !!!"; redo) unless is_a_number?(turn)
      check(turn)
    end
  end

end

player = Game.new
player.run
