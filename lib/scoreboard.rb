require 'yaml'

# Manage score file
class Scoreboard
  FLPATH = File.join(File.dirname('../'), 'score.yml')
  def initialize
    File.new(FLPATH, 'w+') unless File.exist?(FLPATH)
    Scoreboard.error_io unless check_file?
    @score = YAML.load_file(FLPATH)
  end

  def check_file?
    return false unless File.exist?(FLPATH)
    return false unless File.readable?(FLPATH)
    return false unless File.writable?(FLPATH)
    true
  end

  def self.error_io
    puts 'Error I/O'
    exit
  end

  def add(name, tries, time)
    @score = { name_label: name, tries_label: tries, time_label: time }
    File.open(FLPATH, 'a') { |f| f.write(@score.to_yaml) }
  end

  def stats
    @score
  end
end

# require_relative 'lib/scoreboard'
# file = Scoreboard.new
# file.add('Wesley',2,65)
# file.stats
