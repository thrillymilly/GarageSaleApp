# require 'pry'
require 'sinatra'
require 'pg'
# require 'sinatra/reloader'
require_relative 'database_config'
require_relative 'models/lost_pet'
require_relative 'models/user'
require_relative 'models/comment'
require_relative 'models/category'

enable :sessions

helpers do

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in? # should return a boolean
    !!current_user
  end

end

after do
  ActiveRecord::Base.connection.close
end

### HOMEPAGE, SHOWS ALL OF THE LOST PETS ####
get '/' do
  @lost_pets = LostPet.all
  erb :index
end

get '/lost_pets' do #creating a lost pet record
end

get '/lost_pets/new' do #new form page
  erb :new
end

#DISPLAY CLICKED ON DISH#

get '/lost_pets/:id' do
  @lost_pet = LostPet.find(params[:id])
  @comments = @lost_pet.comments
  erb :show
end

### COMMENT ON LOST PET POST ###

post '/comments' do
  comment = Comment.new
  comment.body = params[:body]
  comment.lost_pet_id = params[:lost_pet_id]
  if comment.save
    redirect to "/lost_pets/#{ params[:lost_pet_id] }"
  else
    erb :show
  end
end

### CREATE NEW LOST PET POST ###

post '/lost_pets' do
  lost_pet = LostPet.new
  lost_pet.pet_name = params[:pet_name]
  lost_pet.house_number = params[:house_number]
  lost_pet.street_name = params[:street_name]
  lost_pet.postcode = params[:postcode]
  lost_pet.city = params[:city]
  lost_pet.lost_date = params[:lost_date]
  lost_pet.image_url = params[:image_url]

  if lost_pet.save
  # sql = "INSERT INTO DISHES (name, image_url) VALUES ('#{ params[:name]}', '#{params[:image_url]}');"
  # run_sql(sql)
    redirect '/'
  else
    erb :new
  end
end


### VIEW INDIVIDUAL LOST PET PAGE ###

### EDIT LOST PET ####

get '/lost_pets/:id/edit' do
  @lost_pet = LostPet.find(params[:id])

  erb :edit
end


put '/lost_pets/:id' do
  lost_pet = LostPet.find(params[:id])
  lost_pet.update(pet_name: params[:pet_name], image_url: params[:image_url])
  # run_sql("UPDATE dishes SET name='#{params[:name]}', image_url = '#{params[:image_url]}' WHERE id = #{params[:id]}")
  lost_pet.save
  redirect "/lost_pets/#{params[:id]}"

end



### SIGN UP PAGE ###

get '/' do

  erb :signup
end

post '/signup' do
  user = User.new
  user.first_name = params[:first_name]
  user.second_name = params[:second_name]
  user.email = params[:email]
  user.password = params[:password]

  user.save

  if user.save

    redirect '/session/new'
  end
end


### LOGIN/LOGOUT SESSION ###

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

#delete post
post '/lost_pets/:id/delete' do
  @lost_pet = LostPet.delete(params[:id])

  redirect '/'
end

#logout
delete '/session' do
  session[:user_id] = nil
  redirect '/session/new'

end
