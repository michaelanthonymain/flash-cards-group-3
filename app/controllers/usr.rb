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
  puts "THESE ARE PARMAS"
  p params
  @user = User.find(session[:user_id])
  @deck = Deck.find(params[:deck_id])
  # @round = Round.create(user_id: @user.id, deck_id: @deck.id) ROUND INFO???
  user_input = params[:user_input] 
  if user_input != nil 
    this_card = Card.find(session[:card_id])
    correctness = this_card.check_answer(user_input)
    Guess.create(card_id: session[:card_id], is_correct: correctness, user_input: user_input, round_id: 3) #we have to do something about the rounds
  end
  @flashcard = select_a_random_flashcard(@deck)
  session[:card_id] = @flashcard.id 
  erb :'round/live_round'
end






