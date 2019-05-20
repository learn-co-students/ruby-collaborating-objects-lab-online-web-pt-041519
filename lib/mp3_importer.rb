# require 'pry'
class MP3Importer
  attr_accessor :path
  
  # @files = []
  
  def initialize(path)
    @path = path
  end
  
  def files
    files = []
    Dir.new(path).each do |file|
      files << file if file.length > 4
    end
    files
  end
  
  def import
    files.each{|file| Song.new_by_filename(file)}
  end
end