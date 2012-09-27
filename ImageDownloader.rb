require "./IdWebPage"
require "./IdFolder"

#BaseUrl = "http://eow.alc.co.jp/search?q=test"
BaseUrl = "http://www.ruby-lang.org/"

url = BaseUrl
webPage = IdWebPage.new(url)

title = webPage.getTitle()
imageEnum = webPage.getImageEnum()

folder = IdFolder.new(title)

imageEnum.each {|elem|
  folder.saveImage(elem["src"])
}

