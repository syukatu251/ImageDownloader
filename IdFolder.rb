require 'open-uri'

class IdFolder
  def initialize(folderName)
    @folderName = folderName
  end
  
  def saveImage(imageUrl)
    filename = File.basename(imageUrl)
    open("#{@folderName}/#{filename}", 'wb') do |img|
      open(imageUrl) do |data|
        img.write(data.read)
      end
    end
  end
end