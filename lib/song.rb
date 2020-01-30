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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    return new_song
  end

  def self.create_by_name(song_name)
    new_song = self.create
    new_song.name = song_name
    return new_song
  end

  def self.find_by_name(song_name)
    Song.all.find do | songs |
      songs.name == song_name
    end  
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) 
        self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    Song.all.sort_by do | songs |
      songs.name
    end
  end

  def self.new_from_filename(file_name)
    array = file_name.split(' - ')
    artist_name = array[0]
    new_song_name = array[1].gsub(".mp3", "")

    song = self.new
    song.name = new_song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    array = file_name.split(" - ")
    artist_name = array[0]
    new_song_name = array[1].gsub(".mp3", "")

    song = self.create
    song.name = new_song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end



