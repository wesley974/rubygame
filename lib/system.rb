require 'io/console'

# Trapping and press any key features
class System
  def bybye
    puts "Goodbye #{@name}.\n\n"
    exit
  end

  def ctrlc_trap
    trap('INT') do
      ctrlc_action
    end
  end

  def ctrlc_action
    print "\r^C received. "
    bybye
  end

  def press_any_key
    puts 'Press any key to continue...'
    returns = STDIN.getch
    ctrlc_action if returns == "\u0003"
  end
end
