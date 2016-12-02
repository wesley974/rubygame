require 'fileutils'

# Manage score file
class Scoreboard
  SPACE = 50
  def initialize
    @filepath = File.join(File.dirname('../'), 'score.file')
  end

  def create_file
    FileUtils.touch(@filepath) unless File.exist?(@filepath)
  end

  def check_file
    return false unless File.exist?(@filepath)
    return false unless File.readable?(@filepath)
    return false unless File.writable?(@filepath)
    true
  end

  def view
    File.readlines(@filepath).each do |line|
      puts line.center(SPACE)
    end
  end

  def self.error_io
    puts 'Error I/O'
    exit
  end

  def add(name, tries, time)
    m = "#{name} #{tries} attempts in #{time} seconds"
    File.open(@filepath, 'a') { |f| f.puts m } 
  end

  def count
    File.foreach(@filepath).count
  end

  def remove; end

  def compare; end
end

# require_relative 'lib/scoreboard'
# file = Scoreboard.new
# file.create_file
# file.check_file
# file.count
# file.add('Wesley',2,65)
# file.view
