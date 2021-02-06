require 'sinatra/base'
require './lib/listing'
require './lib/user'

class AirPhP < Sinatra::Base

  enable :sessions

  get '/' do
    redirect '/users/new'
  end

  get '/listings' do
    # Fetch the user from the database, using an ID stored in the session
    @user = User.find(id: session[:user_id])
    @listings = Listing.all
    erb(:'listings/index')
  end

  post '/listings' do
    Listing.create(name: params["name"], description: params["description"], price: params["price"], user_id: session[:user_id])
    redirect '/listings'
  end

  post '/listings/request' do
    Listing.request(id: params["id"])
    redirect '/listings'
  end

  get '/listings/new' do
    erb(:'listings/new', :layout => :layout)
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/listings'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0

end
