class Artist

  @@artists = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = @@artists.length().+(1)
    @cds = []
  end

  attr_reader(:name, :id, :cds)

  define_singleton_method(:all) do
    @@artists
  end

  define_method(:save) do
    @@artists.push(self)
  end

  define_singleton_method(:clear) do
    @@artists = []
  end

  define_singleton_method(:find) do |id|
    found_artist = nil
    @@artists.each() do |artist|
      if artist.id().eql?(id)
        found_artist = artist
      end
    end
    found_artist
  end

  define_method(:add_cd) do |cd|
    @cds.push(cd)
  end
end #end of Artist Class
