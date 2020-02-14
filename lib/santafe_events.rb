require 'colorize'
require_relative 'scrapper.rb'

require_relative 'user_interface.rb'

class SantaFe
  def initialize
    @title = "
  #                                             
  #  |__|  _         _  |_   _      |_          
  #  |  | (_) \)/   (_| |_) (_) |_| |_ .  .  .  
  #                                             
    "
    @scrapy = Scrapper.new
    @scrapy.set_scrap_only
    @css_parameters = ['h2.tribe-events-day-time-slot-heading', 'h3.tribe-events-list-event-title summary',
    'span.tribe-event-date-start', 'div.tribe-events-venue-details > a', 'span.tribe-street-address']
  end

  def run
    puts @title.yellow.center(1)
    puts "Please, entere the date you are planning on visitting. \nFormat is : YYYY/MM/DD"
    day = "19"
    month = "02"
    year = "2020"
    @scrappy.site_url("https://www.santafeciudad.gov.ar/blogs/agenda-sfc/actividades/#{year}-#{month}-#{day}/")
  end

  private

  def scrapp_site(param)
    @scrapy.search_css(param)
  end

  def draw
    puts "This is what I coulod find . . .".yellow


  end
end

