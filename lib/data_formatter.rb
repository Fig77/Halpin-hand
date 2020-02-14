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
    separator = ''
    size.times { separator += char }
    separator
  end

  def box_3(strin)
    "
    + + + + + + + + + + + + + + + + + + +
     #{strin.green}
    + + + + + + + + + + + + + + + + + + +
    "
  end
end

class TextCommons < UiCommons
  def initialize; end

  def row(strin, sep_length)
    i = 0
    while i < strin.length - 1
      puts box_3(strin[i...(i + sep_length)], 'green')
      i += sep_length
    end
  end

  def row_with_content(row, col)
    i = 0
    column = 0
    while i < row.size
      print box_3(row[i])
      print li(col[i])
      i += 1
      column += 1
    end
  end

  def ul(strin, subb = '')
    strin.each { |x| puts subb + "- #{x}" }
  end

  def li(strin)
    " *#{strin}"
  end
end
