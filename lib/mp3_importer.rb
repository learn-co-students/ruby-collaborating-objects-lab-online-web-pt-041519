require 'pry'
class MP3Importer
  
  attr_accessor :path, :filenames
  
  def initialize(path)
    @path = path
    @filenames = []
  end
  # accepts a file path to parse MP3 files from
  
  def files
    @filenames = Dir.entries(path)
    @filenames.delete_if {|filename| filename == "." || filename == ".."}
    @filenames
  end
 
  
  def import
    files.each do |filename|
      Song.new_by_filename(filename)
    end
  end
    # calls import on an instance of MP3 importer
    # calls files which gives an array of files
    # iterates over array of files
   # Creates a new song with filename

end