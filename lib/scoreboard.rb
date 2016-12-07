require 'yaml'

# Manage score file
class Scoreboard
  FLPATH = File.join(File.dirname('../'), 'score.yml')
  def initialize
    @score = YAML.load_file(FLPATH) if File.exist?(FLPATH)
    @score = [] unless @score
  end

  def add(item1, item2, item3)
    @score << { name: item1, tries: item2, time: item3 }
    @score.sort_by! { |i| i[:time] }
    @score.delete_at(3)
    File.open(FLPATH, 'w') { |f| f.write(@score.to_yaml) }
  end

  def stats
    @score
  end
end

# require_relative 'lib/scoreboard'
# file = Scoreboard.new
# file.add('Wesley',2,65)
# Scoreboard.stats
