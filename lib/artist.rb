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
    @songs << song
    save
  end

  # Save this artist to the array of all artists
  def save
    @@all << self
  end

  # Find artist object or creat new object from input artist name
  def self.find_or_create_by_name(artist_name)
    self.all.find{|artist| artist.name == artist_name} || self.new(artist_name)
  end

  # Print all this artist's song names
  def print_songs
    @songs.each {|song| puts song.name}
  end
end