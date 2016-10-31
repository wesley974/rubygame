#!/usr/bin/env ruby

# Last changes : 2016/10/31

# DEBUG
#require 'minitest/autorun'
#class Game < MiniTest::Test

class Game

    def initialize
      @maxnum = 100
    end

    def intro
      puts @maxnum
      puts "\n"
      puts "".ljust(24,"-").center(50)
      puts "|Game : Trouver le nombre|".center(50).upcase
      puts "".ljust(24,"-").center(50)
      puts "\n\n"
      puts " compris entre 1 et #{@maxnum} ".center(50,"*")
      puts "\nPous pouvez choisir d'abandonner à l'aide de la commande 'quit'.\n\n"
    end

    def init_num
      @num = 1 + rand(@maxnum)
      intro
    end

  def show_time
    @stop = Time.now
    puts "\nTemps : #{(@stop - @start).round} secondes\n"
  end

  def winner
    show_time
    puts "\n\nOn a un gagnant!\n"
    puts "Gagné en #{@try} coups! Bravo !\n\n"
    puts "\nGoodbye.\n\n"
    exit
  end

  def big_winner
    show_time
    puts "\n\nWaouu, c'est surprenant !!!\nMais comment est-ce possible ? De la triche ?!\n\n"
    puts "\nGoodbye.\n\n"
    exit
  end

  def is_a_number?(obj)
    obj.to_s == obj.to_i.to_s
  end

  def run
    turn = nil
    @try = 0
    @start = Time.now
    while turn != @num
      print "Essayer ? "
      turn = gets.chomp
      if turn == "quit" then
        exit
        elsif is_a_number?(turn) == false then
          puts "Oh, entre un nombre !!!"
          redo
      end
      @try += 1
      big_winner if turn.to_i == @num && @try == 1
      winner if turn.to_i == @num
      turn.to_i < @num ? (puts "Trop petit!") : (puts "Top grand!")
    end
  end
end

player = Game.new
player.init_num
player.run

