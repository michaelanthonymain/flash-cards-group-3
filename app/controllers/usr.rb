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
  erb :'round/new_round'
end



get '/usr/round/:deck_id' do
  @user = User.find(session[:user_id])
  @deck = Deck.find(params[:deck_id])
  # @round = Round.create(user_id: @user.id, deck_id: @deck.id) ROUND INFO???
  user_input = params[:user_input] 
  if user_input != nil 
    this_card = Card.find(session[:card_id])
    correctness = this_card.check_answer(user_input)
    Guess.create(card_id: session[:card_id], is_correct: correctness, user_input: user_input, round_id: 4) #we have to do something about the rounds
  end
  @flashcard = select_a_random_flashcard(@deck)
  session[:card_id] = @flashcard.id 
  erb :'round/live_round'
end







#IGNORE BELOW


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

