require "fileutils"

directoryName = ARGV[0]

PicturesDirectoryPath = "C:\\Users\\Public\\Pictures"

FileUtils.cd(PicturesDirectoryPath)

FileUtils.makedirs(directoryName)