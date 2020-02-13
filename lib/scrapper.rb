require 'nokogiri'
require 'open-uri'

class Scrapper
  attr_reader :site_url

  def initialize(site)
    @site_url = site
  end

  def set_scrap_only
    @doc = Nokogiri::HTML(url_open)
  end

  def search_xpath; end

  def search_css(selector)
    @doc.css(selector).text
  end

  private

  def url_open
    open(@site_url).read
  end
end
