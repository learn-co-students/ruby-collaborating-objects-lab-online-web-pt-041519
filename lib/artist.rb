require 'pry'
class Artist

  @@all = []
  #this is all artists
  
  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    self.songs << song
  end
  # adds an instance of song to artist_instance.songs
  # songs is an array of song instances
  
  def save
   @@all << self
  end
  # adds an instance of artist to @@all
  # @@all is an array of all artist instances
  
  def self.all
    @@all
  end
  #same as Artist.all which reads @@all
  
  
  def self.find_or_create_by_name(name)
    find = self.all.find {|item| item.name == name}
    if find
      #if find is truthy, find is an instance of an artist
      return find
    else
      Artist.new(name)
    end
  end
  
  # this is a class method that either
  # finds an existing artist name
  # or creates a new instance of artist
  
  def print_songs
    song_names = []
    self.songs.collect {|song| song_names << song.name}
    puts song_names
  end
  # puts a string all of the artists songs
  
end
