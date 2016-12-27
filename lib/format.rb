# Format output
module Format
  SPACES = 50
  HEADER = %w(Name Attempts Time!).freeze
  def self.text(title: nil, msg: nil)
    puts "\n\n#{title.center(SPACES).green.bold}" if title
    puts "#{msg.center(SPACES)}\n" if msg
  end

  def self.table(datas)
    table = Terminal::Table.new headings: HEADER, rows: datas
    table.align_column(1, :center)
    table.align_column(2, :center)
    puts table.render.split("\n").map { |ln| ln.center(50) }.join("\n")
  end
end
