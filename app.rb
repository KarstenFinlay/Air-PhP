require 'sinatra/base'

class AirPhP < Sinatra::Base

  get '/' do
  'Hello World!'
  end

  get '/listings' do
    erb(:'listings/index')
  end

  post '/listings' do
    @listing = params
    erb(:'listings/index')
  end

  get '/listings/new' do
    erb(:'listings/new')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
  
end
