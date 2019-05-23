require 'pry'

class Song
  attr_accessor :name, :artist
  attr_reader :artist_name

  def initialize(name)
    @name = name
    @artist = self.artist
  end

  # Parse filename, create new song, associate song with artist, and return new song instance
  def self.new_by_filename(filename)
    # Separate filename into song name and artist name
    file = filename.delete_suffix(".mp3").split(" - ")
    song_name = file[1]
    song_artist_name = file[0]

    # Create new song instance
    song = self.new(song_name)
 
    # Associate song with artist object
    song.artist = Artist.find_or_create_by_name(song_artist_name)
    
    # Save song to @@all artist array 
    song.artist.add_song(song)

    # Return song object
    return song
  end
end