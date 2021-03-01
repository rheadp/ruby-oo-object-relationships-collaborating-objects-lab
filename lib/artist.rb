class Artist
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name 
        @@all << self 
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        artist = @@all.find {|artist| artist.name = name} #detects all artist names, iterates through each artist name, if existing returns name and if not found creates artist name
        artist = self.new(name) if !artist
        artist
    
    end

    def print_songs
        songs.each {|song| puts song.name}
    end

end
