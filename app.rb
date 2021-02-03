require 'sinatra/base'
require './lib/listing.rb'

class AirPhP < Sinatra::Base

  get '/' do
  'Hello World!'
  end

  get '/listings' do
    @listings = Listing.all
    erb(:'listings/index')
  end

  post '/listings' do
    Listing.create(name: params["name"])
    redirect '/listings'
  end

  patch '/listings/request' do
    redirect '/lisings'
  end

  get '/listings/new' do
    erb(:'listings/new')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
