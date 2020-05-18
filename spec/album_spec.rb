require('spec_helper')

# describe '#Album' do

#   # before(:each) do
#   #   Album.clear()
#   # end

  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Album.all).to(eq([]))
    end
  end

#   describe("#name") do
#     it("returns the name of an album") do
#       album = Album.new("In Rainbows", nil, 2007, "Rock", "Radiohead")
#       expect(album.name()).to(eq("In Rainbows"))
#     end
#   end
  describe('#save') do
    it("saves an album") do
      album = Album.new({:name => "Giant Steps", :id => nil, :year => 2000, :cost => 10})
      album.save()
      album2 = Album.new({:name => "Blue", :id => nil, :year => 2005, :cost => 12})
      album2.save()
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      album = Album.new({:name => "Giant Steps", :id => nil, :year => 2000, :cost => 10})
      album.save()
      album2 = Album.new({:name => "Blue", :id => nil, :year => 2000, :cost => 12})
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      # album = Album.new("Giant Steps", nil, 2000, "rock", "chi")
      # album2 = Album.new("Giant Steps", nil, 2000, "rock", "chi")
      album = Album.new({:name => "Blue", :id => nil, :year => 2000, :cost => 12})
      album2 = Album.new({:name => "Blue", :id => nil, :year => 2005, :cost => 12})
      expect(album).to(eq(album2))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      album = Album.new({:name => "Blue", :id => nil, :year => 2000, :cost => 10})
      album.save()
      album2 = Album.new({:name => "Red", :id => nil, :year => 2005, :cost => 12})
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('#update') do
    it("updates an album by id") do
      album = Album.new({:name => "Giant Steps", :id => nil, :year => 2000, :cost => 10})
      album.save()
      album.update("A Love Supreme")
      expect(album.name).to(eq("A Love Supreme"))
    end
  end

  describe('#delete') do
    it("deletes all songs belonging to a deleted album") do
      album = Album.new({:name => "Giant Steps", :id => nil, :year => 2000, :cost => 10})
      album.save()
      song = Song.new({:name => "Naima", :album_id => album.id, :id => nil})
      song.save()
      album.delete()
      expect(Song.find(song.id)).to(eq(nil))
    end
  end

#   describe("#sort") do 
#     it ("sorts albums by name") do 
#       album = Album.new("Giant Steps", nil, 2000, "rock", "chi")
#       album.save()
#       album2 = Album.new("Blue", nil, 2010, "pop", "celeste")
#       album2.save()
#       expect(Album.sort).to(eq([album2,album]))
#     end
#   end
  
#   describe("#sold") do
#     it("will show that an album is sold") do
#       album = Album.new("Giant Steps", nil, 2000, "rock", "chi")
#       album.save()
#       album2 = Album.new("Blue", nil, 2010, "pop", "celeste")
#       album2.save()
#       album.sold()
#       album.delete
#       expect(Album.all).to(eq([album2]))
#     end
#   end
  
#   describe("#sold") do
#     it("it will show all sold albums") do
#       album = Album.new("Giant Steps", nil, 2000, "rock", "chi")
#       album.save()
#       album2 = Album.new("Blue", nil, 2010, "pop", "celeste")
#       album2.save()
#       album.sold()
#       expect(album.sold).to(eq(true))
#     end
#   end
  describe('#songs') do
    it("returns an album's songs") do
      album = Album.new({:name => "Giant Steps", :id => nil, :year => 2001, :cost => 10})
      album.save()
      song = Song.new({:name => "Naima", :album_id => album.id, :id => nil, :cost => 12})
      song.save()
      song2 = Song.new({:name => "Cousin Mary", :album_id => album.id, :id => nil, :cost => 15})
      song2.save()
      expect(album.songs).to(eq([song, song2]))
    end
  end

  describe(".sort_by_name") do
    it("returns all albums sorted alphabetically") do
      album = Album.new({:name => "Blue", :id => nil, :year => 2000, :cost => 12})
      album.save()
      album2 = Album.new({:name => "Red", :id => nil, :year => 2005, :cost => 13})
      album2.save()
      album3 = Album.new({:name => "Green", :id => nil, :year => 2010, :cost => 11})
      album3.save()
      expect(Album.sort_by_name).to(eq([album, album3, album2]))
    end
  end

  describe(".sort_by_year") do
    it("returns all albums sorted by year") do
      album = Album.new({:name => "Blue", :id => nil, :year => 2005, :cost => 10})
      album.save()
      album2 = Album.new({:name => "Red", :id => nil, :year => 2000, :cost => 12})
      album2.save()
      album3 = Album.new({:name => "Green", :id => nil, :year => 2010, :cost => 15})
      album3.save()
      expect(Album.sort_by_year).to(eq([album3, album, album2]))
    end
  end

  describe(".sort_by_cost") do
    it("returns all albums sorted by cheapest cost") do
      album = Album.new({:name => "Blue", :id => nil, :year => 2005, :cost => 10})
      album.save()
      album2 = Album.new({:name => "Red", :id => nil, :year => 2000, :cost => 12})
      album2.save()
      album3 = Album.new({:name => "Green", :id => nil, :year => 2010, :cost => 15})
      album3.save()
      expect(Album.sort_by_cost).to(eq([album, album2, album3]))
    end
  end

  


