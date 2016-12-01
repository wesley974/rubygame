require 'fileutils'

# Manage score file
class Scoreboard
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
      puts line
    end
  end

  def self.error_io
    puts 'Error I/O'
    exit
  end

  def add; end

  def count; end

  def remove; end

  def add_empty_line; end
end

# require_relative 'lib/scoreboard'
# player = Scoreboard.new
# player.create_file
# player.check_file
# player.view
