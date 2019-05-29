class Artist 
  
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def self.all 
    @@all 
  end 

  def save
    @@all << self 
  end 
  
  def add_song(song_name)
    @songs << song_name
  end 
  
  def self.find_or_create_by_name(artist_name)
    self.find(artist_name).nil? ? self.create(artist_name) : self.find(artist_name)
  end 

  def self.find(name)
    @@all.find do |artist|
      artist.name == name 
    end 
  end 
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end 
  
  def print_songs
    @songs.each {|song| puts song.name}
  end 

end 





