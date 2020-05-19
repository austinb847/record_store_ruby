require('spec_helper')

describe('#Artist') do

  describe('#update') do
    it("adds an album to an artist") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      album = Album.new({:name => "A Love Supreme", :id => nil, :year => 2005, :cost => 12})
      album.save()
      artist.update({:album_name => "A Love Supreme"})
      expect(artist.albums).to(eq([album]))
    end
  end

  describe('#update') do
    it("updates an artist name by id") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      artist.update({:name => "Ice Cube"})
      expect(artist.name).to(eq("Ice Cube"))
    end
  end

  describe('.all') do
    it("returns a list of all artists") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Ice Cube", :id => nil})
      artist2.save()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end

  describe('#save') do
    it("saves an artist") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Ice Cube", :id => nil})
      artist2.save()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end

  describe("#==") do
    it("is the same artist if both have the same name") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist2 = Artist.new({:name => "John Coltrane", :id => nil})
      expect(artist).to(eq(artist2))
    end
  end

end
