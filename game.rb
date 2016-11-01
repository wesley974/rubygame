#!/usr/bin/env ruby

# Last changes : 2016/11/01

# DEBUG
#require 'minitest/autorun'
#class Game < MiniTest::Test

class Game

    SPC = 50

    def initialize
      @maxnum = 100
    end

    def annonce
      title = "|Game : The magician|"
      puts "\n" + title.center(SPC)
    end

    def init_num
      @num = 1 + rand(@maxnum)
      teaser = "\sFind the number between 1 and #{@maxnum}\s"
      quit_cmd = "\nYou can abandon with the command 'quit'.\n\n"
      annonce
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

  def is_a_number?(obj)
    obj.to_s == obj.to_i.to_s
  end

  def run
    turn = nil
    @try = 0
    @check_time = Time.now
    while turn != @num
      print "Try ? "
      turn = gets.chomp
      if turn == "quit" then
        byebye
        elsif is_a_number?(turn) == false then
          puts "Please, a number !!!"
          redo
      end
      @try += 1
      big_winner if turn.to_i == @num && @try == 1
      winner if turn.to_i == @num
      turn.to_i < @num ? (puts "Too small!") : (puts "Too BIG!")
    end
  end
end

player = Game.new
player.init_num
player.run

