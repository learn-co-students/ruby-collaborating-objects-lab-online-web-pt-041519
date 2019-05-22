class MP3Importer

  attr_accessor :path

  def initialize(file_path)
    @path =  file_path
  end

  def files
    Dir.entries('./spec/fixtures/mp3s').select {|f| !File.directory? f}
  end

  def import
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end
end
