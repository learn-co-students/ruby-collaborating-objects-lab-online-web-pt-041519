
require "pry"
class Song
attr_accessor :name, :artist


def initialize(name)
  @name = name
end

def self.new_by_filename(path)
song = Song.new(path.split(" - ")[1])
song.artist = Artist.create_by_name(path.split(" - ")[0])
song.artist.songs << song
song.artist.save
song
end

end
