require 'nokogiri'
require 'open-uri'

class Scrapper
attr_reader :site_url

	def initialize(site)
		@site_url = site
	end

	def set_scrap_only
		@doc = raw_parse
	end

	def search_xpath
	end

	def search_css(selector)
		@doc.css(selector).text
	end

	private
	def raw_parse
		Nokogiri::HTML(open(@site_url))
	end

end
