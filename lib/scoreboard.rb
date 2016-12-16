require 'yaml'

# Manage score file
class Scoreboard
  FLPATH = File.join(File.dirname('../'), 'score.yml')
  Row = Struct.new(:name, :tries, :time, :timestamp)
  def initialize
    @score = File.exist?(FLPATH) ? YAML.load_file(FLPATH) : []
  end

  def add(name, tries, time, timestamp = Time.new)
    @score = [*@score, Row.new(name, tries, time, timestamp)]
             .sort_by(&:time)
             .first(3)
    write if @score.any? { |row| row.timestamp == timestamp }
  end

  def info
    @score.map { |a| [a[:name], a[:tries], a[:time]] }
  end

  private
    def write
      File.open(FLPATH, 'w') { |f| f.write(@score.to_yaml) }
    end
end

# require_relative 'lib/scoreboard'
# file = Scoreboard.new
# file.add('Wesley',2,65) => number
# file.info => [[], [], []]
