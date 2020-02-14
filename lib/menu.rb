require_relative 'data_formatter.rb'
require 'colorize'

class MenuScene
  def initialize
    @title_screen = "

  #  '##::::'##::::'###::::'##:::::::'########::'####:'##::: ##:::'####:
  #   ##:::: ##:::'## ##::: ##::::::: ##.... ##:. ##:: ###:: ##::: ####:
  #   ##:::: ##::'##:. ##:: ##::::::: ##:::: ##:: ##:: ####: ##::: ####:
  #   #########:'##:::. ##: ##::::::: ########::: ##:: ## ## ##:::: ##::
  #   ##.... ##: #########: ##::::::: ##.....:::: ##:: ##. ####::::..:::
  #   ##:::: ##: ##.... ##: ##::::::: ##::::::::: ##:: ##:. ###:::'####:
  #   ##:::: ##: ##:::: ##: ########: ##::::::::'####: ##::. ##::: ####:
  #  ..:::::..::..:::::..::........::..:::::::::....::..::::..::::....::

  Printing my bills since 31/2/2020
    ".green.center(1)
    @status = 1
    @options = ['1. Whats on?'.yellow, '2. I am going to Santa-Fe, is there anything to do?',
                '3. Bills!'.red, '5. exit']
    @text = TextCommons.new
  end

  def run
    puts @title_screen
    puts " Hi Tester! What can I help you with today?\n".cyan
    puts 'DESIGN IN PROCESS'.red + '  Design almost finish, implementing'.yellow + '  white is active!'.white
    puts ''
    @text.ul(@options)
    input = gets.chomp
    input.to_i
  end
end
