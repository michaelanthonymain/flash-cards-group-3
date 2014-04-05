enable :sessions

# GET  /user/:id // gets and renders current user data in a profile view
# POST /user/:id // updates new information about user


#loading basic root stuff, y'all know this
get '/' do
  @name = params[:session][:name]

  erb :index
end

get '/login' do
  erb :login
end

#form from main page posts to /login.
post '/login' do
  if User.authenticate(params[:name], params[:password]) #authenticate is a User method that matches user input to database records
    session[:name] = params[:name]
    session[:password] = params[:password]
    puts "!!!!!"
    p session.inspect
    puts "!!!!!"
    redirect '/usr'
  else
    erb :login
  end
end

get '/register' do
  erb :register
end

post '/register' do
  p params
  @new_user = User.new(name: params[:name], password: params[:password])
  if @new_user.save
    redirect '/' #this should probably lead to the users page that Ron is writing.
  else
    erb :register
  end
end

# #just logs the user out, and clears the session. redirects to root.
get '/logout' do
  session.clear
  erb :logout
end
