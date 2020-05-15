require 'pry'

# Parse directory of files
# Send filenames to Song class
class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  # Return array of all mp3 files in path
  def files
    # Navigate to path, then grab mp3 files
    Dir.chdir(@path) { Dir.glob("*.mp3") }
  end

  # Create new song for each input filename
  def import
    files.each { |filename| Song.new_by_filename(filename) }
  end
end
