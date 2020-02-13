require 'colorize'

class UiCommons
  def initialize; end

  def loading(sle)
    puts 'loading'.yellow
    dot = '.'
    5.times do
      print dot.yellow
      sleep(0.5)
    end
    sleep(sle)
  end

  def separate_with(char, size); end
end
