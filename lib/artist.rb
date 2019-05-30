require 'pry'
class Artist 
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end  
  
  def add_song(song)
    @songs << song
  end  
  
  def save
    @@all.find {|artist| artist == self} == nil ? @@all << self : @@all 
  end  
  
  def self.all
    @@all.uniq
  end  
  
  def self.find_or_create_by_name(name)
    if @@all.find {|artist| artist.name == name} == nil
      self.new(name)
    else 
      @@all.find {|artist| artist.name == name}
    end
  end  
  
  def print_songs
    @songs.each {|song| puts song.name}
  end  
  
end  