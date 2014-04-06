
def current_user
  # p session
  if params[:name]
      @current_user ||= User.where(name: params[:name]).first
      # p @current_user
  end
end


def initialize_deck_instance(deck_id)
	return Deck.find(deck_id)
end

def select_a_random_flashcard(deck, round_id)
	if (Guess.where(round_id: round_id)).count == (deck.cards).count
		return nil
	end

	bool = false
	while bool == false do
		card = deck.sample_from_deck
		bool = true
		(Guess.where(round_id: round_id)).each do |guess|
			if guess.card_id == card.id
				bool = false
			end
		end
	end
	return card
end




