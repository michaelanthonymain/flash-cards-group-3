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

#ROUND 

get '/usr/round/:deck_id' do

  @user = User.find(session[:user_id])
  @deck = Deck.find(params[:deck_id])
  
  if params[:submit_new_round] == "play"
    @round = Round.create(user_id: @user.id, deck_id: @deck.id)
    session[:round_id] = @round.id
  end  

  user_input = params[:user_input] 
  
  if user_input != nil 
    this_card = Card.find(session[:card_id])
    correctness = this_card.check_answer(user_input)
    Guess.create(card_id: session[:card_id], is_correct: correctness, user_input: user_input, round_id: session[:round_id])
  end

  @flashcard = select_a_random_flashcard(@deck, session[:round_id])


  if @flashcard == nil  
    @round = Round.find(session[:round_id])
    @guesses_arr = @round.guesses
    @num_correct = @round.get_number_correct
    @total_num = @deck.cards.count
    erb :'round/finish_round' 
  else
    session[:card_id] = @flashcard.id 
    erb :'round/live_round'
  end

end


# DECK CREATION

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




