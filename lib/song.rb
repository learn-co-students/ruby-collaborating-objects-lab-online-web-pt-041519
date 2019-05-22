class Song 
  
  attr_accessor :name, :artist 
  
  def initialize(name)
    @name = name 
  end
  
  def self.new_by_filename(filename)
    name = filename.split(" - ")[1]
    artist = filename.split(" - ")[0]
    song = Song.new(name)
    artist = Artist.find_or_create_by_name(artist)
    song.artist = artist
    artist.add_song(song)
    return song
  end 
  
end