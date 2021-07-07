class Song 

  attr_accessor :name, :artist
  
  def initialize(name)
    @name = name
  end

# We'll also want to associate that new song with an artist. To do this we'll use a helper method: Song#artist().
# Return the new song instance.

  def self.new_by_filename(file_name)
      arr = file_name.split(/[-]+/)
      arr.each {|e| e.strip!}
      artist_name = arr.first
      song_name = arr[1]
      song = Song.new(song_name)
      song.artist = Artist.find_or_create_by_name(artist_name)
      song.artist.add_song(song_name)
      song
   end

end