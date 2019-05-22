class Song 

  attr_accessor :name, :artist 
  
  def initialize(name)
    @name = name
  end
  
  
  def self.new_by_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    song = Song.new(song_name)
    star = Artist.find_or_create_by_name(artist_name)
    song.artist = star
    #binding.pry 
    star.add_song(song)
     song 
  end

end