require 'pry'
class Song
attr_accessor :name, :artist
@@all = []
def initialize(name)
    @name = name 
    @@all << self
end

def self.all
    @@all
end

def self.new_by_filename(filename)
    new_file = filename.split(" - ")
    song_name = new_file[1]
    song_artist_name = new_file[0]
    artist = Artist.find_or_create_by_name(song_artist_name)
    new_song = Song.new(song_name)
    artist.add_song(new_song)
    new_song
end

def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    @artist = artist
end
end
