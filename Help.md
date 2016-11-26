## Tasks to complete

# 1 - Put all output messages in show.rb library 

How to communicate between classes (using instance, variable, constants...)

	puts "\nTime left : #{(Time.now - @start_time).round} seconds\n"

	puts "#{@tries} tries, good job !\n\n"

	puts "\nGoodbye #{@name}.\n\n"

replace them by (in the core.rb) :

	Show.your_time

	Show.your_tries

	Show.bybye


# 2 - Fix the Rubocop issues

Refactoring ?

	lib/core.rb:91:7: C: Don't use parentheses around a method call.
      (Show.warn_number; redo) unless a_number?(answer)
      ^^^^^^^^^^^^^^^^^^^^^^^^
	lib/core.rb:91:24: C: Do not use semicolons to terminate expressions.
      (Show.warn_number; redo) unless a_number?(answer)
                       ^

# 3 - Add a score file

How to deal with this ? 

- Record the best 3 times (name + time)
- Show the score just before 'Enter your name'

# 4 - Improve the code
Valid with Rubocop & codebeat
