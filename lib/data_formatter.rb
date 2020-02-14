require_relative 'user_interface.rb'
require 'colorize'

class UiCommons
  def initialize; end

  def loading(sle)
    puts ' loading'.yellow
    dot = ' .'
    5.times do
      print dot.yellow
      sleep(0.5)
    end
    sleep(sle)
  end

  def separate_with(char, size)
    separator = ""
    size.times { separator += char }
    separator += "\n"
  end

  def box_3(string)
   s_in_box =  "  + + + + + + + + + + + + + + + + + + +
                  #{string}                         
                  + + + + + + + + + + + + + + + + + + + "
  end
end

class TextCommons < UiCommons 
  def initialize; end

  def row(string, sep_length)
  	i = 0
  	while i < string.length
  		puts box_3(string[i...sep_length])
  		i += sep_length
  	end
  end

  def ul(string)
    string.each { |x| puts "- #{x}" }
  end

  def li(string); end
end
