require "pry"
class Artist

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    match = @@all.find {|artist| artist.name == name}
    new_artist = self.new(name)
    new_artist.save
    new_artist
    match || new_artist
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

end