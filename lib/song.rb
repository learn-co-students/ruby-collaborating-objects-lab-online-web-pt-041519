class Song
  
  attr_accessor :name, :artist
  
  def initialize(name)
    @name = name
  end
  # when a new song instance is created
  # @name is set equal to name
  
  def self.new_by_filename(file_name)
    split_name = file_name.split(/( - )|(.mp3)/)
    
    # Song 
    song_instance = self.new(split_name[2])
  
    # Find corresponding Artist
    artist_instance = Artist.find_or_create_by_name(split_name[0])
    artist_instance.save
    # Set song.artist to its corresponding artist
    # and artist_instance.songs now contains our song_instance!
    song_instance.artist = artist_instance
    artist_instance.add_song(song_instance)
    
    song_instance
    # test: new_instance.artist.name = "Michael Jackson"
    # Artist.all (returns @@all, all artists)
  end
  # creates a new song instance
  # with name = filename
  
end