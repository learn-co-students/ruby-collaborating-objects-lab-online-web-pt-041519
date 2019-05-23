require 'pry'

class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  # Parse filename, create new song, associate song with artist, and return new song instance
  def self.new_by_filename(filename)
    # Separate filename into song name and artist name
    artist, song_name = filename.delete_suffix(".mp3").split(" - ")

    # Create new song instance
    song = self.new(song_name)

    # Associate song with artist object
    song.artist_name = artist

    # Return song object
    return song
  end

  # Get artist object and save song to Artist @@all
  def artist_name=(name)
    # Find or create artist object
    self.artist = Artist.find_or_create_by_name(name)
    # Save song to @@all artist array 
    artist.add_song(self)
  end

end