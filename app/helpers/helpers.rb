# def create_cards_from_deck_array(deck_id)
# 	new_deck = Deck.find(deck_id)
# 	return new_deck.get_cards
# end

# def get_card()
# 	cards_arr = create_cards_from_deck_array
# 	card = cards_array.delete_at(0)
# 	return card
# end

def initialize_deck_instance(deck_id)
	return Deck.find(deck_id)
end







