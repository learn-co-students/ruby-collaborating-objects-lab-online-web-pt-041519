require 'pry'

class Artist
  attr_accessor :name, :songs

  @@all = []

  def self.all
    @@all
  end

  # Initialize with artist's name and empty array for this artist's songs
  def initialize(name)
    @name = name
    @songs = []
  end

  # Add input song instance to array of this artist's songs
  def add_song(song)
    # binding.pry

    ## Add this to @@all instead of @songs?
    #@songs << song
    # song.artist = @name
    @songs << song
    save
  end

  # Save this artist to the array of all artists
  def save
    self.class.all << self
  end

  # Find artist object or creat new object from input artist name
  def self.find_or_create_by_name(artist_name)
    self.all.find{|artist| artist.name == artist_name} || self.new(artist_name)
  end

  # Return all this artist's song names
  def print_songs
    @songs.select {|song| puts song.name}
  end
end