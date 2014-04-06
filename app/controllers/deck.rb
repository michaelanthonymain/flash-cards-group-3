# DECK CREATION

get '/usr/decks' do
  @user = User.find(session[:user_id])
  @decks = @user.decks 
  erb :'deck/make_deck'
end

post '/usr/decks' do
  @deck_name = params[:deck_name] 
  @deck = Deck.create!(name: @deck_name, user_id: session[:user_id])
  redirect "/usr/decks/#{@deck.id}/cards"
end

post '/usr/decks/delete/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @deck.destroy
  redirect "/usr/decks"
end

# CARD CREATION

get '/usr/decks/:deck_id/cards' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards 
  erb :'deck/make_card'
end

post '/usr/decks/:deck_id/cards' do 
  @deck = Deck.find(params[:deck_id])
  Card.create!(deck_id: @deck.id, question: params[:question], answer: params[:answer])
  redirect "/usr/decks/#{@deck.id}/cards"
end

post '/usr/decks/:deck_id/cards/delete/:card_id' do
  @deck = Deck.find(params[:deck_id])
  @card = Card.find(params[:card_id])
  @card.destroy
  redirect "/usr/decks/#{@deck.id}/cards"
end

# Card Editing

get '/usr/decks/:deck_id/cards/:card_id' do
  @deck = Deck.find(params[:deck_id])
  @card = Card.find(params[:card_id])
  erb :'deck/edit_card'
end

post '/usr/decks/:deck_id/cards/:card_id' do
  @deck = Deck.find(params[:deck_id])
  @card = Card.find(params[:card_id])
  @card.question = params[:question]
  @card.answer = params[:answer]
  @card.save  
  redirect "/usr/decks/#{@deck.id}/cards"
end

