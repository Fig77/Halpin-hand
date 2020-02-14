require 'colorize'
require_relative 'scrapper.rb'
require_relative 'data_formatter.rb'
require 'date'

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
    puts "Please, entere the date you are planning on visitting. \nFormat is : dd-mm-yyyy"
    input = gets.chomp
    begin
      date = Date.parse(input)
    rescue ArgumentError
      puts 'WRONG INPUT, DELETING HARD DISK or... try again, whatever'.red
      sleep(1)
      return 0
    end
    day = date.strftime('%d')
    month = date.strftime('%m')
    year = date.strftime('%Y')
    @scrapy.site_url = "https://www.santafeciudad.gov.ar/blogs/agenda-sfc/actividades/#{year}-#{month}-#{day}/"
    @daty_format.loading(2)
    @scrapy.set_scrap_only
    draw
    puts 'press ener to continue ... '.red
    gets.chomp
    2
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
    content.each { |x| auxiliar.push(x.text.gsub(/\s+/, ' ')) }
    auxiliar
  end

  def content_format(title, day, adress)
    i = 0
    content = []
    while i < title.size
      string_aux = "#{title[i].cyan}\n      - #{day[i].green}\n     -- #{adress[i].cyan}"
      content.push(string_aux)
      i += 1
    end
    content
  end
end
