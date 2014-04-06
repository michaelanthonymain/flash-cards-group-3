enable :sessions

get '/usr' do
  @user = session[:user] 
  erb :'usr/usrpage'
end 

post '/usr/round' do
  deck_id = params[:deck].to_i
  @deck = Deck.find(deck_id)

  # p @deck.sample_one_card
  session[:deck_id] = deck_id
  puts "THIS IS SESSION"
  p session

  erb :'round/new_round'
end

#this get request occurs after the user submits the play button on /usr/round -> usr/round/1?

get '/usr/round/:deck_id' do 
  # if params[:user_input]
  #   puts "HERE IS THE USER INPUT"
  #   puts params[:user_input]
  # end
  
  #write code to create a guess

  # @user = User.find(session[:user] 

  deck_id = session[:deck_id]
  # @round = Round.create(user_id: @user.id, deck_id: deck_id)
  erb :'round/live_round'
end



