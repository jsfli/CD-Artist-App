require('rspec')
require('artist')
require('cd')

describe(Artist) do

  before() do
    Artist.clear()
    @test_artist = Artist.new({:name=>"Oasis"})
  end

  describe("#initialize") do
    it("sets the paramters of a new Artist") do
      @test_artist
      expect(@test_artist.name()).to(eq("Oasis"))
      expect(@test_artist.id()).to(eq(1))
      expect(@test_artist.cds()).to(eq([]))
    end
  end

  describe(".all") do
    it("is an empty list of artist to begin with") do
      expect(Artist.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds an artist to the array of artists") do
      @test_artist
      @test_artist.save
      expect(Artist.all()).to(eq([@test_artist]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved artists") do
      @test_artist
      @test_artist.save
      Artist.clear()
      expect(Artist.clear()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns an Artist by the id number") do
      @test_artist
      @test_artist.save()
      expect(Artist.find(@test_artist.id())).to(eq(@test_artist))
    end
  end

  describe("#add_cd") do
    it("adds a new cd to an artist") do
      @test_artist
      test_cd = CD.new({:title=>"CD title 1"})
      @test_artist.add_cd(test_cd)
      expect(@test_artist.cds()).to(eq([test_cd]))
    end
  end

end
