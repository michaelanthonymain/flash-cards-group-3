enable :sessions

get '/' do
  current_user
  erb :index
end
