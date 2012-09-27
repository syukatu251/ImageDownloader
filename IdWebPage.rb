require 'rubygems'
require 'hpricot'
require 'open-uri'

class IdWebPage
  def initialize(url)
    @document = Hpricot(open(url))
  end
  
  def getImageEnum
    @document.search("img")
  end
  
  def getTitle
    @document.search("title").first.inner_html
  end
end