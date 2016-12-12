require 'yaml'

# Manage score file
class Scoreboard
  FLPATH = File.join(File.dirname('../'), 'score.yml')
  Row = Struct.new(:name, :tries, :time, :timestamp)
  def initialize
    @score = YAML.load_file(FLPATH) if File.exist?(FLPATH)
    @score = [] unless @score
  end

  def add(name, tries, time, timestamp = Time.new)
    @score << Row.new(name, tries, time, timestamp)
    @score.sort_by! { |i| i[:time] }
    @score.delete_at(3)
    File.open(FLPATH, 'w') { |f| f.write(@score.to_yaml) }
    @score.any? { |d| d[3] == timestamp }
  end

  def stats
    @score
  end

  def layout
    @score.map { |a| [a[:name], a[:tries], a[:time]] }
  end
end

# require_relative 'lib/scoreboard'
# file = Scoreboard.new
# file.add('Wesley',2,65) => number
# file.stats => [{}, {}, {}]
# file.layout => [[], [], []]
# file.add? => true or false
