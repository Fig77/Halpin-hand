require 'open-uri'

class UrlHandle
  def initialize(site)
    @url = site
  end

  def read_url
    open(@url).read
  end
end
