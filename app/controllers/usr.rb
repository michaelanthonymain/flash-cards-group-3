enable :sessions

get '/usr' do
  @user = User.find(session[:user_id])
  @total_guesses = total_guesses(@user)
  correct_guesses(@total_guesses)
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

#STATISTICS



