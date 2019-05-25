class Artist
  attr_accessor :name, :songs

  @@all = []

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
    artist = @@all.find{|artist| artist.name == name}
    if artist == nil
      artist = Artist.new(name)
      artist.save
    end
    artist
  end

  def print_songs
    self.songs.each {|song|puts song.name}
  end
end
