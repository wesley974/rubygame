# Show output messages
class Show
  SPACES = 50
  def self.title
    title = '|Game : The magician|'

    puts "\n #{title.center(SPACES)}"
  end

  def self.teaser
    teaser = "\sFind the number between 1 and #{Core::MAXNUM}\s"
    quit = "\nYou can abandon with the command 'quit'.\n\n"

    puts "#{teaser.center(SPACES, '*')} \n\n #{quit}"
  end

  def self.name
    print "\nEnter your name :\s"
  end

  def self.play
    puts "Let's play!\n\n"
  end

  def self.try
    print "Try ?\s"
  end

  def self.smaller
    puts 'Too small!'
  end

  def self.bigger
    puts 'Too Big!'
  end

  def self.warn_number
    puts 'Please, a number !!!'
  end

  def self.winner
    puts "\n\nWe have a winner!\n"
  end

  def self.big_winner
    puts "\n\nWow, amazing !!!\nWe have found our magician ?!\n\n"
  end
end
