require 'nokogiri'
require_relative 'url_handle'

class Scrapper
  attr_accessor :site_url

  def initialize(site = "null")
    @site_url = site
  end

  def set_scrap_only
    make_url
    @doc = Nokogiri::HTML(url_doc)
  end

  def search_xpath; end

  def search_css(selector)
    @doc.css(selector).text
  end

  private

  def make_url
    @site_url = UrlHandle.new(@site_url)
  end

  def url_doc
    @site_url.read_url
  end
end
