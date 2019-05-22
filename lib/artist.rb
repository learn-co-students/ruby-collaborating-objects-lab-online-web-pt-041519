require "pry"
class Artist 
  @@all = []
  
  attr_accessor :name
  attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def add_song(song)
    save
    @songs << song
    #song.artist = self
  end
  
  def print_songs
    @songs.each{|song| puts song.name}
  end
  
  def self.find_or_create_by_name(name)
     match = self.all.detect{|x| x.name == name}
    if match == nil
       match = self.new(name)
    end
    match
  end
  
end