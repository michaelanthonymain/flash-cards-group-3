enable :sessions

# GET  /user/:id // gets and renders current user data in a profile view
# POST /user/:id // updates new information about user


get '/login' do
  erb :login
end

post '/login' do
  if User.authenticate(params[:name], params[:password])
    session[:name] = params[:name]
    session[:password] = params[:password]
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

get '/logout' do
  session.clear
  erb :logout
end
