class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    save
    @songs << song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    findsong = self.all.detect{ |s| s.name == name }
    if findsong == nil
       findsong = self.new(name)
    end
    return findsong
  end

  def print_songs
    @songs.each{ |n| puts n.name}
  end

end
