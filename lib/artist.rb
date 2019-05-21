require_relative "../lib/song.rb"
require_relative "../lib/mp3_importer.rb"

class Artist
   @@all = []
   
   attr_accessor :name, :songs 
 
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    self.songs << song
  end
  
  def self.all
    @@all
  end 
  
  def save
    @@all << self 
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.find_by_name(artist_name)
    @@all.find{|art| art.name == artist_name}
  end
  
  def self.create_by_name(artist_name)
    artist = Artist.new(artist_name)
    artist.save
    artist
  end
  
  def print_songs
    songs.each do |song|
      puts song.name
    end 
  end 
end