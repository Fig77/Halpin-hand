require 'nokogiri'
require_relative 'url_handle'

class Scrapper
  attr_reader :site_url

  def initialize(site)
    @site_url = UrlHandle.new(site)
  end

  def set_scrap_only
    @doc = Nokogiri::HTML(url_doc)
  end

  def search_xpath; end

  def search_css(selector)
    @doc.css(selector).text
  end

  private
  def url_doc
    @site_url.read_url
  end
end
