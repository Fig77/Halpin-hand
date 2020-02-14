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
    @css_parameters = ['h2.tribe-events-day-time-slot-heading', 'h3.tribe-events-list-event-title a',
    'span.tribe-event-date-start', 'div.tribe-events-venue-details a', 'span.tribe-street-address']
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
    puts "\nThis is what I could find . . .".yellow
    event_time = content_array(scrapp_site(@css_parameters[0]))
    event_title_pre = content_array(scrapp_site(@css_parameters[1]))
    event_day = content_array(scrapp_site(@css_parameters[2]))
    event_adress = content_array(scrapp_site(@css_parameters[4]))
    @daty_format.row_with_content(event_time, content_format(event_title_pre, event_day, event_adress))
  end

  def content_array(content)
    auxiliar = []
    space_clean = ""
    content.each { |x| auxiliar.push(x.text.gsub(/\s+/, " "))}
    auxiliar
  end

  def content_format(title, day, adress)
    i = 0
    string_aux = ""
    content = []
    while i < title.size
      string_aux = "#{title[i].cyan}\n     - #{day[i].green}\n    -- #{adress[i].cyan}"
      content.push(string_aux)
      i += 1
    end
    content
  end

end
clasy = SantaFe.new
clasy.run