class CD
  @@cds = []

  define_method(:initialize) do |attributes|
    @title = attributes.fetch(:title)
    @id = @@cds.length().+(1)
  end

  attr_reader(:title, :id)

  define_singleton_method(:all) do
    @@cds
  end

  define_method(:save) do
    @@cds.push(self)
  end

  define_singleton_method(:clear) do
    @@cds = []
  end

  define_singleton_method(:find) do |identification|
    found_cd = nil
    @@cds.each() do |cd|
      if cd.id().eql?(identification.to_i())
        found_cd = cd
      end
    end
    found_cd
  end

end #end of CD class
