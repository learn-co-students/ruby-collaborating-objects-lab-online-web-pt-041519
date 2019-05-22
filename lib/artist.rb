require 'pry'

class Artist
  # Needs the following instance variables: name, songs
  # Needs the following CLASS variables: @@all
  # Needs the following instance methods: initialize(name), add_song, save, print_songs
  # Needs the following CLASS methods: all - class reader method, .find_or_create_by_name(name)

  # Create instance variables, class variable, and class variable reader method
  attr_accessor :name, :songs
  @@all = []
  def self.all
    @@all
  end

  # Will be instantiated with a name, and assigned an empty array for its @song (instance variable)
  def initialize(name)
    @name = name
    @songs = []
  end

  # THIS METHOD IS CALLED WITHIN THE SONG.RB FILE, IN THE #new_by_filename SONG CLASS METHOD
  # Adds an existing song to the artist's song array.
  def add_song(song)
    @songs << song
  end

  # THIS METHOD IS CALLED WITHIN THE SONG.RB FILE, IN THE #new_by_filename SONG CLASS METHOD
  # Adds the artist to the Artist CLASS variable @@all
  # Artists must be manually added into @@all because it is not done at instantiation.
  def save
    @@all << self
  end

  # THIS METHOD IS CALLED WITHIN THE SONG.RB FILE, IN THE #artist_name INSTANCE METHOD.
  # If the artist exists already within the @@all CLASS variable, it returns that artist.
  # If the artist does not exist, it is created, saved to @@all, and returned.
  def self.find_or_create_by_name(name)
    artist = self.all.find {|artist| artist.name == name }
    if artist
      artist
    else
      artist = self.new(name)
      artist.save
      artist
    end
  end

  # Iterates through the @songs INSTANCE variable,
  # Extrapolates each song's @name INSTANCE variable,
  # PUTS an array of only song titles, not song objects.
  # Will return nil.
  def print_songs
    puts songs.map { |song| song.name }
  end
end
