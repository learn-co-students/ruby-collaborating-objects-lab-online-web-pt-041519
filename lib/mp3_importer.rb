require 'pry'

class MP3Importer
  # Needs the following instance variables: files, path
  # Needs the following CLASS variables: @@list_of_files
  # Needs the following instance methods: initialize(path), files, import
  # Needs the following CLASS method: list_of_files - class reader method

  # Create instance variables, class variable, and class reader method
  attr_accessor :files, :path
  @@list_of_files = []
  def self.list_of_files
    @@list_of_files
  end

  # Will be instantiated with a path in the following format:
  ### "./spec/fixtures/mp3s"
  def initialize(path)
    @path = path
  end

  # This INSTANCE method uses the path that was assigned at instaniation,
  # and returns an array that only has valid .mp3 files.
  # It will do this by collecting only filenames that end with ".mp3"
  ### (For this example, it removed some dot files.)
  ### If the filename did not end with ".mp3", nil was pushed to the return array. #compact removed all nils.
  ##### Dir.entries(path) returns an array of all files within the given folder,
  ##### with the path pointing to a folder.
  def files
    @files = Dir.entries(@path).map { |filename| filename if filename[-4..-1] == ".mp3" }.compact
  end

  # This INSTANCE method calls the files method, which returns an array of file names
  # It iterates over those file names, and creates a new song from each using the #new_by_filename Song CLASS METHOD
  # Which it then pushes into the library (@@list_of_files)
  def import
    files.each { |filename| @@list_of_files << Song.new_by_filename(filename) }
  end
end
