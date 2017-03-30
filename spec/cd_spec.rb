require('rspec')
require('cd')

describe(CD) do

  before() do
    CD.clear()
    @test_cd = CD.new({:title=>"CD Title 1"})
  end

  describe("#initialize") do
    it("set the parameters of a new CD") do
      @test_cd
      expect(@test_cd.title()).to(eq("CD Title 1"))
      expect(@test_cd.id()).to(eq(1))
    end
  end

  describe(".all") do
    it("CD array is empty at first") do
      expect(CD.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a CD to the array of saved CD") do
      @test_cd
      @test_cd.save()
      @test_cd
      @test_cd.save()
      expect(CD.all()).to(eq([@test_cd,@test_cd]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved CD") do
      @test_cd
      @test_cd.save()
      CD.clear()
      expect(CD.all()).to(eq([]))
    end
  end
end
