require 'pry'

class Album

  attr_reader :id 
  attr_accessor :name, :year, :cost #:sold_albums, :year, :genre, :artist
  
  

  def initialize(attributes)
    @name = attributes.fetch(:name)  
    @id = attributes.fetch(:id)
    @year = attributes.fetch(:year).to_i
    @cost = attributes.fetch(:cost).to_i
    # @genre = attributes.fetch(:genre)
    # @artist = attributes.fetch(:artist)
    # @sold_albums = false 
   
  end

  def self.all
    returned_albums = DB.exec("SELECT * FROM albums;")
    albums = []
    returned_albums.each() do |album|
      name = album.fetch("name")
      id = album.fetch("id").to_i
      year = album.fetch("year").to_i
      cost = album.fetch("cost").to_i
      albums.push(Album.new({:name => name, :id => id, :year => year, :cost => cost}))
    end
    albums
  end

  def self.sort_by_name()
    sorted_albums = DB.exec("SELECT * FROM albums ORDER BY name;")
    albums = []
    sorted_albums.each() do |album|
      name = album.fetch("name")
      id = album.fetch("id").to_i
      year = album.fetch("year").to_i
      cost = album.fetch("cost").to_i
      albums.push(Album.new({:name => name, :id => id, :year => year, :cost => cost}))
    end
    albums
  end

  def self.sort_by_year()
    sorted_albums = DB.exec("SELECT * FROM albums ORDER BY year DESC;")
    albums = []
    sorted_albums.each() do |album|
      name = album.fetch("name")
      id = album.fetch("id").to_i
      year = album.fetch("year").to_i
      cost = album.fetch("cost").to_i
      albums.push(Album.new({:name => name, :id => id, :year => year, :cost => cost}))
    end
    albums
  end

  def self.sort_by_cost()
    sorted_albums = DB.exec("SELECT * FROM albums ORDER BY cost;")
    albums = []
    sorted_albums.each() do |album|
      name = album.fetch("name")
      id = album.fetch("id").to_i
      year = album.fetch("year").to_i
      cost = album.fetch("cost").to_i
      albums.push(Album.new({:name => name, :id => id, :year => year, :cost => cost}))
    end
    albums
  end

  def self.random()
    sorted_albums = DB.exec("SELECT * FROM albums ORDER BY random() LIMIT 1;")
    albums = []
    sorted_albums.each() do |album|
      name = album.fetch("name")
      id = album.fetch("id").to_i
      year = album.fetch("year").to_i
      cost = album.fetch("cost").to_i
      albums.push(Album.new({:name => name, :id => id, :year => year, :cost => cost}))
    end
    albums
  end
    
  def save
    #@@albums[self.id] = self
    result = DB.exec("INSERT INTO albums (name, year, cost) VALUES ('#{@name}', '#{@year}', '#{@cost}') RETURNING id;") # [{:name => "some_name", :id => 2}]
    @id = result.first().fetch("id").to_i  
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    DB.exec("DELETE FROM albums *;")
  end

  def self.find(id)
    album = DB.exec("SELECT * FROM albums WHERE id =#{id};").first
    name = album.fetch("name")
    id = album.fetch("id").to_i
    year = album.fetch("year").to_i
    cost = album.fetch("cost").to_i
    Album.new({:name => name, :id => id, :year => year, :cost => cost})
  end

  # def self.search(search)
  #   @@albums.values().select {|a| a.name.match(/#{search}/i)}
  # end 

  def update(name)
    @name = name
    DB.exec("UPDATE albums SET name = '#{@name}' WHERE id = #{@id};")
  end

  # def self.sort()
  #    @@albums.values().sort_by(&:name)
  # end

  def delete()
    DB.exec("DELETE FROM albums WHERE id = #{@id};")
    DB.exec("DELETE FROM songs WHERE album_id = #{@id};")
  end
   
  # def sold
  #   @@albums[self.id].sold_albums = true
  # end
  
  def songs
    Song.find_by_album(@id)
  end
end

