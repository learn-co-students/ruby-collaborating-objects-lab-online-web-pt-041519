require 'pry'

class Artist 

  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    @songs << song
    # song.artist = self
  end  
  
  def songs
    @songs
  end
  
  def self.find_or_create_by_name(name)
    @@all.find {|e| e.name == name } || self.new(name)
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  # print ou all songs from an artist instance
  def print_songs
    @songs.each { |e| puts e.name }
  end

end #Artist
