class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select{|entry| entry.include?(".mp3")}
    # Dir.glob('*.mp3')

  end

  def import
    files.map {|file| Song.new_by_filename(file)}
    files
  end

end
