
class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
    @artist = artist
  end

  def self.artist
    @artist
  end


  def self.new_by_filename(filename)
    file_name = filename.split(" - ")
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    song = self.new(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    song.artist = artist
    artist.add_song(song)
    return song

  end




end
