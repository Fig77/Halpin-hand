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

  def row(string, sep_length)
    i = 0
    cuantity = string.length / sep_length
    while i < string.length - 1
      puts box_3(string[i...(i + sep_length)], "green")
      i += sep_length
    end
  end

  def row_with_content(row, col)
    i = 0
    column = 0
    while i < row.size
      print box_3(row[i], "green")
      print li(col[i])
      i += 1
      column += 1
    end
    puts "\n\n\n"
  end 

  def ul(string, subb = "")
    string.each { |x| puts subb + "- #{x}" }
  end

  def li(string, char = "")
    " *#{string}"
  end
end
