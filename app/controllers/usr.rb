enable :sessions

get '/usr' do
  @user = User.find(session[:user_id])
  erb :'usr/usrpage'
end 

get '/usr/play' do
  @user = User.find(session[:user_id])
  erb :play
end

post '/usr/round' do
  deck_id = params[:deck_id].to_i
  @deck = Deck.find(deck_id) 
  erb :'round/new_round'
end

get '/usr/round/:deck_id' do 
  @user = User.find(session[:user_id])
  @deck = Deck.find(params[:deck_id])
  @round = Round.create(user_id: @user.id, deck_id: @deck.id)
  erb :'round/live_round'
end

# DEC

get '/usr/new_deck' do
  @user = User.find(session[:user_id])
  @decks = @user.decks 
  erb :make_deck
end

post '/usr/new_deck' do
  p params
  @deck_name = params[:deck_name] 
  @deck = Deck.create!(name: @deck_name, user_id: session[:user_id])
  p @deck
  redirect "/usr/new_deck/#{@deck_name}/new_card"
end

post '/usr/new_deck/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @deck.destroy
  redirect "/usr/new_deck"
end


# CARD

get '/usr/new_deck/:deck_name/new_card' do
  @deck = Deck.where(name: params[:deck_name]).first 
  @cards = @deck.cards 
  erb :make_card
end

post '/usr/new_deck/:deck_name/new_card' do 
  @deck = Deck.where(name: params[:deck_name]).first
  Card.create!(deck_id: @deck.id, question: params[:question], answer: params[:answer])
  redirect "/usr/new_deck/#{@deck.name}/new_card"
end

post '/usr/new_deck/:deck_name/new_card/:card_id' do
  @deck = Deck.where(name: params[:deck_name]).first
  @card = Card.find(params[:card_id])
  @card.destroy
  redirect "/usr/new_deck/#{@deck.name}/new_card"
end




