enable :sessions

# GET  /logout   // destroys session and redirects to /
# GET  /login    // gets the webpage that has the login form
# POST /login    // authenticates credentials against database and either redirects home with a new session or redirects back to /login
# GET  /register // gets the webpage that has the registration form
# POST /register // records the entered information into database as a new /user/xxx
# GET  /user/:id // gets and renders current user data in a profile view
# POST /user/:id // updates new information about user


#loading basic root stuff, y'all know this
get '/' do
  # Look in app/views/index.erb
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
    redirect '/'
  else
    erb :login
  end
end

# #creates a new user.
# get '/register' do
#   erb :register #this is just a form that creates a new user
# end

# #Form from line 50 posts here, creates a new User object
# post '/register' do
#   User.create()
#   # erb :index
# end



# #just logs the user out, and clears the session. redirects to root.
# get '/logout' do
#   session.clear
#   redirect '/'
# end
