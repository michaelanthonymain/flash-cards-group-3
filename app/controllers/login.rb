enable :sessions

# GET  /user/:id // gets and renders current user data in a profile view
# POST /user/:id // updates new information about user


get '/login' do
  erb :login
end

post '/login' do
  # login_information = params[:name]
  if User.authenticate(params[:name], params[:password])
    # session[:name] = params[:name]
    # session[:password] = params[:password]
    puts "!!!!!!user created in session"
    p current_user
    session[:user] = current_user
    p session
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
    session[:user] = current_user
    redirect '/usr' #this should probably lead to the users page that Ron is writing.
  else
    erb :register
  end
end

get '/logout' do
  session.clear
  erb :logout
end
