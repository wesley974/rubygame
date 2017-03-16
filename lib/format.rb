# Format text and table
module Format
  SPACES = 50
  HEADER = %w(Name Attempts Time!).freeze
  TITLE = 'The best 3 SCORE'.freeze

  def self.text(title: nil, msg: nil)
    puts "\n\n#{title.center(SPACES).green.bold}" if title
    puts "#{msg.center(SPACES)}\n" if msg
  end

  def self.table(datas, winner: false)
    t = Terminal::Table.new(title: TITLE, headings: HEADER, rows: datas)
    1.upto(2) { |x| t.align_column(x, :center) }
    puts t.render.split("\n").map { |ln|
      Format.table_line(ln, winner)
    }.join("\n")
  end

  def self.table_line(ln, winner)
    ln = ln.center(SPACES).green.bold \
      if winner && winner.all? { |e| ln.include?(e.to_s) }
    ln.center(SPACES)
  end
end
