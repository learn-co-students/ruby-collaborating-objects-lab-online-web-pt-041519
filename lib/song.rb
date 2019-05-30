require 'pry'
class Song 
  attr_accessor :name, :artist
  
  def initialize(name)
    @name = name 
  end  
  
  def name= (name)
    @name = name 
  end
  
  def self.new_by_filename(file)
    #binding.pry
    song = self.new(file.split(" - ")[1])
    song.artist = Artist.find_or_create_by_name(file.split(" - ")[0])
    song.artist.add_song(song)
    song
    #binding.pry
  end
end  