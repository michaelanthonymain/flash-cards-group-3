get '/usr' do
  @current_user = current_user
  erb :'usr/usrpage'
end 

post '/usr/round' do
  deck_id = params[:deck].to_i
  @deck = Deck.find(deck_id) 
  erb :'round/new_round'
end