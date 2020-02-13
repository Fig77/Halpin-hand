require 'open-uri'

class UrlHandle
  def initialize(s)
    @url = s
  end

  def get_url
    open(@url).read
  end
end
