require 'pry'
class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        begin
            Dir.chdir(self.path)
            Dir.glob("*.mp3")
        rescue
            Dir.glob("*.mp3")
        end
    end

    def import
        self.files.each do |file|
            Song.new_by_filename(file)
        end
    end
end