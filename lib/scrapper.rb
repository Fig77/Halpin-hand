require 'nokogiri'
require 'mechanize'
require_relative 'url_handle'

class Scrapper
  attr_accessor :site_url

  def initialize(site = 'null')
    @site_url = site
  end

  def set_scrap_only
    make_url
    @doc = Nokogiri::HTML(url_doc)
  end

  def search_xpath; end

  def search_css(selector)
    @doc.css(selector)
  end

  private

  def make_url
    @site_url = UrlHandle.new(@site_url)
  end

  def url_doc
    @site_url.read_url
  end
end

class ActiveScrapper < Scrapper
  def initialize(site = 'null')
    super(site)
    @agent = Mechanize.new
  end

  def set_agent
    @agent.get(@site_url)
  end

  private

  def make_url
    super
  end
end
