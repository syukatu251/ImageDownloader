require 'open-uri'

class IdFolder
  def initialize(folderName)
    @folderName = folderName
    Dir::mkdir(folderName) unless File.exists?(folderName)
  end
  
  def saveImage(imageUrl)
    p imageUrl.path
    filename = File.basename(imageUrl.path)
    open("#{@folderName}/#{filename}", 'wb') do |img|
      open(imageUrl) do |data|
        img.write(data.read)
      end
    end
  end
end