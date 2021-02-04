require 'sinatra/base'
require './lib/listing'
require './lib/user'

class AirPhP < Sinatra::Base



  get '/' do
  'Hello World!'
  end

  get '/listings' do
    @listings = Listing.all
    erb(:'listings/index')
  end

  post '/listings' do
    Listing.create(name: params["name"], description: params["description"], price: params["price"])
    redirect '/listings'
  end

  post '/listings/request' do
    Listing.request(id: params["id"])
    redirect '/listings'
  end

  get '/listings/new' do
    erb(:'listings/new', :layout => :layout_alt)
  end

  get '/users/new' do
   erb(:'users/new')
  end

  post '/users' do
    @user = User.create(email: params['email'], password: params['password'])
    erb(:'users/index')
  end


  # start the server if ruby file executed directly
  run! if app_file == $0

end
