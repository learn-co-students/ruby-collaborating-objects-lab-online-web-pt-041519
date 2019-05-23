class Artist 
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def add_song(title)
    @songs << title
  end
  
  def save
    @@all << self
  end 
  
  def self.all
    @@all 
  end 
  
  def self.find_or_create_by_name(name)
   artist = self.all.find { |a| a.name == name}
    if artist == nil 
      artist = Artist.new(name)
      artist.save
    end
    artist
  end 
  
  def print_songs
    @songs.each {|s| puts s.name}
  end
  
end 
