get '/game' do
	erb :game
end


get '/next' do
	user_input = params[:user_input]
	puts "------------------------------------------------------------"
	p user_input
	# Guess.create(user_input: user_input,   )
	p @current_card

	erb :game
end

