enable :sessions

get '/usr' do
  @user = session[:user]
  p @user
  p session
  erb :'usr/usrpage'
end 

post '/usr/round' do
  deck_id = params[:deck].to_i
  @deck = Deck.find(deck_id) 
  session[:deck] = @deck
  erb :'round/new_round'
end

get '/usr/round/:deck_id' do 
  @user = session[:user]
  @deck = session[:deck]
  p session
  @round = Round.create(user_id: @user.id, deck_id: @deck.id)
  erb :'round/live_round'
end