require 'pry'
require 'sinatra'
require 'pg'
require 'sinatra/reloader'
require_relative 'database_config'
require_relative 'models/dish'
require_relative 'models/dish_type'
require_relative 'models/user'
require_relative 'models/comment'

get '/' do
  @garage_sales = Garage_sale.all
  erb :index
end


get '/session/new' do

erb :login
end

post '/session' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    #you are ok, let me create a session for you
    session[:user_id] = user.id

    redirect '/'
  else
    #your password or email were incorrect
    erb :login
  end
end
