# Show output messages
class Show
  def self.title
    title = '|Game : The magician|'

    puts "\n" + title.center(Core::SPC)
  end

  def self.teaser
    teaser = "\sFind the number between 1 and #{Core::MAXNUM}\s"
    quit = "\nYou can abandon with the command 'quit'.\n\n"

    puts teaser.center(Core::SPC, '*') + "\n\n" + quit
  end

  def self.name
    print "\nEnter your name : "
  end

  def self.play
    puts "Let's play!\n\n"
  end
end
