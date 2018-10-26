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
    new = self.new
    new.save
    new
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find do |song|
        song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
        song.name
    end
  end

  def self.new_from_filename(fname)
    file = self.new
    splt = fname.split(/(.mp3)+|\-/)
    file.name = splt[1].strip
    file.artist_name = splt[0].strip
    file
  end
  
  def self.create_from_filename(fname)
    file = self.new
    splt = fname.split(/(.mp3)+|\-/)
    file.name = splt[1].strip
    file.artist_name = splt[0].strip
    file.save
    file
  end
  
  def self.destroy_all
    self.all.clear
  end
end
