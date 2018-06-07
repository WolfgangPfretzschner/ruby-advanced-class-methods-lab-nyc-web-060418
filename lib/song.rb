require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    # s returns<Song:0x007fdad62f2a98 @name="Blank Space"> thats why check for name!!!
    @@all.detect do |s|
      s.name == name
      # binding.pry
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(filename)
    half = filename.split(" - ")
    name = half[1]
    name = name[0...-4]
    artist_name = half[0]

    song = self.new
    song.name=name
    song.artist_name = artist_name
    song
    # binding.pry
  end

  def self.create_from_filename(filename)
    half = filename.split(" - ")
    name = half[1]
    name = name[0...-4]
    artist_name = half[0]

    song = self.create
    song.artist_name = artist_name
    song.name = name
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
