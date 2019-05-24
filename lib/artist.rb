class Artist
 @@all=[]
  attr_accessor :name
  attr_reader :songs
 
  def initialize(name)
    @name= name
    @songs=[]
  end

def self.all
  @@all
end

def save
  @@all << self
end

def add_song(song)
  @songs << song
end

  def self.find_or_create_by_name(name)
    find_song = self.all.find {|artist| artist.name == name }
    new_artist= self.new(name)
    new_artist.save
    new_artist
    find_song || new_artist
  end
  
  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end
  
end 