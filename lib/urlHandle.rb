require 'open-uri'

class UrlHandle
	def initialize(s)
		@url = s
	end

	def getUrl
		open(@url).read
	end
end