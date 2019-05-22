class Artist
  attr_accessor :name , :all
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    # @@all << self
  end

  def add_song(song) #keeps track of an artist's songs
   @songs << song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
   #finds or creates an artist by name maintaining uniqueness
   artist = @@all.find{|artist| artist.name == name}  #artist_1 = Artist.find_or_create_by_name("Michael Jackson")
   if artist == nil
      artist = Artist.new(name)
      artist.save
   end
    artist
  end

  def print_songs # lists all of the artist's songs
   puts @songs.map { |song| song.name  }
  end

end
