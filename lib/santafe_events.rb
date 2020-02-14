require 'colorize'
require_relative 'scrapper.rb'
require_relative 'data_formatter.rb'

class SantaFe
  def initialize
    @title = "
  #                                             
  #  |__|  _         _  |_   _      |_          
  #  |  | (_) \)/   (_| |_) (_) |_| |_ .  .  .  
  #                                             
            "
    @scrapy = Scrapper.new
    @css_parameters = ['h2.tribe-events-day-time-slot-heading', 'h3.tribe-events-list-event-title summary',
    'span.tribe-event-date-start', 'div.tribe-events-venue-details > a', 'span.tribe-street-address']
    @daty_format = TextCommons.new
  end

  def run
    puts @title.yellow.center(1)
    puts "Please, entere the date you are planning on visitting. \nFormat is : YYYY/MM/DD"
    puts "Day: "
    day = gets.chomp
    puts "Month: "
    month = gets.chomp
    puts "Year: "
    year = gets.chomp
    @scrapy.site_url = "https://www.santafeciudad.gov.ar/blogs/agenda-sfc/actividades/#{year}-#{month}-#{day}/"
    @daty_format.loading(2)
    @scrapy.set_scrap_only
    draw
  end

  private

  def scrapp_site(param)
    @scrapy.search_css(param)
  end

  def draw
    puts "\nThis is what I coulod find . . .".yellow
    @daty_format.row(scrapp_site(@css_parameters[0]), 5)
  end
end
clasy = SantaFe.new
clasy.run