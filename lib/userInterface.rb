require 'colorize'

class UiCommons
  def initialize
  end

  def loading(s)
    puts "loading".yellow
    5.times { print ".".yellow; sleep(0.5)}
    sleep(s)
  end

  def separate_with(char, size)
  end
end