require 'colorize'

class UiCommons
  def initialize; end

  def loading(sle)
    puts 'loading'.yellow
    5.times { print ".".yellow; sleep(0.5)}
    sleep(sle)
  end

  def separate_with(char, size); end
end
