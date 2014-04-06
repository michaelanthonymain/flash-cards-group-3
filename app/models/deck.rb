class Deck < ActiveRecord::Base
	belongs_to :user 
	has_many :cards 

	attr_accessor :cards_arr


	# def get_cards #don't get cards like this SEE BELOW
	# 	@cards_arr = self.cards.shuffle
	# end

	# def pick_card
	# 	this_card = self.cards_arr.delete_at(0)
	# 	return this_card
	# end

	def sample_one_card
		card = (self.cards).sample(1)[0]
		(Guess.all).each do |guess|
			if guess.card_id != card.id
				return card
			end
		end
	end
end


#SEE ABOVE (get_cards) i don't want to have a method to get the cards for my deck. there must be a different way to get the cards from the deck. I can do it using active record. so is there a way to pick a card randomly using active record calls?

