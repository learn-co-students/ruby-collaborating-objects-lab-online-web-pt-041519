class MP3Importer
=begin
   1.parses a directory of files
   2.sends the filenames to a song class / create a library of music with artists that are unique
   3. `path` attribute that gets set on initialization
   4. methods = Mp3Importer#files - MP3Importer#import
=end
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select {|entry| entry.include?(".mp3")}
  end

  def import
     files.each { |filename| Song.new_by_filename(filename)}
  end

  end
