require 'pry'

class Artist

  attr_reader :id 
  attr_accessor :name
  
  

  def initialize(attributes)
    @name = attributes.fetch(:name)  
    @id = attributes.fetch(:id)
   
  end

  def self.all
    returned_artists = DB.exec("SELECT * FROM artists;")
    artists = []
    returned_artists.each() do |artist|
      name = album.fetch("name")
      id = album.fetch("id").to_i
      artists.push(Artist.new({:name => name, :id => id}))
    end
    artists
  end
    
  def save
    result = DB.exec("INSERT INTO artists (name) VALUES ('#{@name}') RETURNING id;") 
    @id = result.first().fetch("id").to_i  
  end

  def ==(artist_to_compare)
    self.name() == artist_to_compare.name()
  end

  def self.clear
    DB.exec("DELETE FROM artists *;")
  end

  def self.find(id)
    artist = DB.exec("SELECT * FROM artists WHERE id =#{id};").first
    name = artist.fetch("name")
    id = artist.fetch("id").to_i
    Artist.new({:name => name, :id => id})
  end

  def update(name)
    @name = name
    DB.exec("UPDATE artists SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete()
    DB.exec("DELETE FROM artists WHERE id = #{@id};")
    #DB.exec("DELETE FROM songs WHERE album_id = #{@id};")
  end

  
  # def songs
  #   Song.find_by_album(@id)
  # end
end