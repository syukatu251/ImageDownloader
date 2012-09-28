require 'open-uri'
require "pathname"


DirectoryPathname = Pathname.new(ARGV[0]) 
ImageUrl = ARGV[1]

FileName = File.basename(ImageUrl.path)
FilePathname = DirectoryPathname + FileName

open(FilePathname, 'wb') do |imageFile|
  open(ImageUrl) do |imageData|
    imageFile.write(imageData.read)
  end
end