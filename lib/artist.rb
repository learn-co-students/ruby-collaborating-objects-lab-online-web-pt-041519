require 'pry'
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

    def self.find_or_create_by_name(name)
        self.all.each {|artist| return artist if artist.name == name}
        Artist.new(name)
    end

    def add_song(song)
        self.songs << song
        self.save
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end
end