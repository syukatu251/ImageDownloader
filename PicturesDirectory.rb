require "fileutils"
require "pathname"
require 'uri'
require 'open-uri'

class PicturesDirectory
  PicturesDirectoryPath = "C:/Users/Public/Pictures"
  
  def initialize(dirs)
    @pathname = Pathname.new(PicturesDirectoryPath) + dirs
  end
  
  private
  def makedirs
    FileUtils.cd(PicturesDirectoryPath)
    FileUtils.makedirs(@pathname.relative_path_from(Pathname.getwd))
  end
  
  public
  def saveImage(imageUrl)
    uri = URI.parse(imageUrl)
    makedirs
    
    fileName = File.basename(uri.path)
    filePathname = @pathname + fileName
    
    open(filePathname, 'wb') do |imageFile|
      open(imageUrl) do |imageData|
        imageFile.write(imageData.read)
      end
    end
  end
end

case ARGV[0]
when "saveImage" then
  directory = PicturesDirectory.new(ARGV[1])
  directory.saveImage(ARGV[2])
end