# The MP3 Importer will parse all the filenames in the spec/fixtures folder and send the filenames to the Song class
require "pry"

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |file| file.gsub("#{path}/", "") }
  end

  def import
    files.each{ |filename| Song.new_by_filename(filename) }
  end

end
