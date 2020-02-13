require 'nokogiri'
require 'net/http'

class Scrapper
  attr_reader :site_url

  def initialize(site)
    @site_url = site
  end

  def set_scrap_only
    @doc = raw_parse
  end

  def search_xpath; end 

  def search_css(selector)
    @doc.css(selector).text
  end

  private

  def raw_parse
    # web = Nokogiri::HTTP.open('site')
  end
end
