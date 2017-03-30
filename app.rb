require('sinatra')
  require('sinatra/reloader')
  also_reload('lib/**/*.rb')
  require ('./lib/cd')
  require ('./lib/artist')

  get('/') do
    erb(:index)
  end

  get('/artists/new') do
    erb(:artists_form)
  end

  get('/artists') do
    @artists = Artist.all()
    erb(:artists)
  end

  post('/artists') do
    @artists = Artist.all()
    name=params.fetch("name")
    hash = {:name => name}
    artist = Artist.new(hash)
    artist.save()
    erb(:artists)
  end

  get('/artists/:id') do
    @artist = Artist.find(params.fetch('id').to_i())
    erb(:artist)
  end

  get('/artists/:id/cds/new') do
    @artist = Artist.find(params.fetch('id').to_i())
    erb(:artists_cds_form)
  end

  post('/cd') do
    title = params.fetch("title")
    hash = {:title => title}
    @cd = CD.new(hash)
    @cd.save()
    @artist = Artist.find(params.fetch('artist_id').to_i())
    @artist.add_cd(@cd)
    erb(:artist)
  end

  get('/cds/:id') do
    @cd = CD.find(params.fetch("id"))
    erb(:cd)
  end
