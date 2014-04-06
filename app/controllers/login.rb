enable :sessions

get '/login' do
  erb :login
end

post '/login' do
  if User.authenticate(params[:name], params[:password])
    session[:user_id] = current_user.id
    "no error"
  else
    "error"
  end
end

get '/register' do
  erb :register
end

post '/register' do
  @new_user = User.new(name: params[:name], password: params[:password])
  if @new_user.save
    session[:user_id] = current_user.id
    redirect '/usr'
  else
    erb :register
  end
end

get '/logout' do
  session.clear
  erb :logout
end
