require 'pry'

class Song
  # Needs the following instance variables: name, artist
  # Needs the following instance methods: initialize(name), artist_name=(name),
  # Needs the following CLASS method: new_by_filename(filename)

  # Create instance varables:
  attr_accessor :name, :artist

  # Will be instantiated with a name
  def initialize(name)
    @name = name
  end

  # Used to create an artist to assign to a song if the song exists first,
  # Or assign an existing artist if the artist already exists.
  # THIS METHOD IS CALLED WITHIN THE #new_by_filename Song CLASS METHOD
  def artist_name=(name)
    # Call the Artist CLASS METHOD #find_or_create_by_name to assign the artist to the song.
    ### This method will either create a new artist, or assign an existing artist and save it.
    self.artist = Artist.find_or_create_by_name(name)
  end




  # THIS METHOD IS CALLED WITHIN THE MP3_IMPORTER FILE, IN THE #import INSTANCE METHOD
  # It is passed a string formatted like this:
  ### "Michael Jackson - Black or White - pop.mp3"
  # Then extrapolates the title and artist, and creates a new song object.
  def self.new_by_filename(filename)

    # Create the new song object, extrapolating the song name from the filename.
    song = self.new(filename.split(" - ")[1])

    # Assign an artist for the song via the #artist_name INSTANCE method. (** BELONGS TO)
    song.artist_name=(filename.split(" - ")[0])

    # Assign the song to the artist by calling the #add_song Artist INSTANCE METHOD (** HAS MANY)
    song.artist.add_song(self)

    # Return the newly created song object.
    song
  end
end
