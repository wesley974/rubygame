require 'yaml'

# Manage score file
class Scoreboard
  FILE_PATH = File.join(File.dirname('../'), 'score.yml')
  Row = Struct.new(:name, :tries, :time, :timestamp)
  def initialize
    @score = File.exist?(FILE_PATH) ? YAML.load_file(FILE_PATH) : []
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
      File.write(FILE_PATH, @score.to_yaml)
    end
end

# Testing with irb
# ----------------------------------
# require_relative 'lib/scoreboard'
# file = Scoreboard.new
# file.add('Wesley',2,65) => Integer
# file.info => [[], [], []]
