enable :sessions

get '/usr' do
  @user = User.find(session[:user_id])
  erb :'usr/usrpage'
end 

get '/usr/play' do
  @user = User.find(session[:user_id])
  puts '/usr/play'
  p session
  p params
  erb :play
end

post '/usr/round' do
  deck_id = params[:deck_id].to_i
  @deck = Deck.find(deck_id) 
  puts "/usr/round"
  p session
  p params
  erb :'round/new_round'
end

get '/usr/round/:deck_id' do 
  @user = User.find(session[:user_id])
  @deck = Deck.find(params[:deck_id])
  @round = Round.create(user_id: @user.id, deck_id: @deck.id)
  puts "/usr/round/:deck_id"
  p session
  p params
  erb :'round/live_round'
end

get '/usr/new_deck' do
  erb :make_deck
end

post '/usr/new_deck' do
  @deck_name = params[:deck_name] 
  redirect "/usr/new_deck/#{@deck_name}"
end

get '/usr/new_deck/:deck_name' do
  @deck_name = params[:deck_name]
  @user = User.find(session[:user_id])
  # @deck = Deck.create(name: @deck_name, )
  erb :make_card
end

