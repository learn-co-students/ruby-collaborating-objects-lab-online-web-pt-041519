require 'pry'

class MP3Importer

  attr_accessor :path 
  
  def initialize(path)
    @path = path 
  end 
  
  def files 
    files = []
    Dir.children(self.path).each do  |file| 
      files << file
    end 
    files
  end 

  def import
    self.files.each do |filename| 
      Song.new_by_filename(filename) 
    end 
  end
  
end 