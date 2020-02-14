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

  def box_3(string, col)
   s_in_box ="  
   + + + + + + + + + + + + + + + + + + +
    #{string.green}
   + + + + + + + + + + + + + + + + + + + 
   "
  end
end

class TextCommons < UiCommons 
  def initialize; end

  def row(string, sep_length, content_under = "")
  	i = 0
  	cuantity = string.length / sep_length
  	while i < string.length - 1
  		puts box_3(string[i...(i + sep_length)], "green")
  		puts content_under if content_under.length != 0
  		i += sep_length
  	end
  end

  def ul(string, subb = "")
    string.each { |x| puts subb + "- #{x}" }
  end

  def li(string); end
end
