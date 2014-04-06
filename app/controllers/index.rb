enable :sessions

get '/' do
  @user = User.find(session[:user_id]) if session[:user_id]
  erb :index
end





