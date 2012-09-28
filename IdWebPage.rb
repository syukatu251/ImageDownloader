require 'rubygems'
require 'hpricot'
require 'open-uri'

class IdWebPage
  def initialize(url)
    #@document = Hpricot(open(url))
    @url = url
    @document = open(url) { |f| Hpricot(f) }
    #puts @document.methods
  end
  
  def getImageEnum
    @document.search("img")
  end
  
  def getTitle
    @document.search("title").first.inner_html
  end
  
  def getUrl
    @url
  end
end