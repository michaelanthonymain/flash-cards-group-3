class Deck < ActiveRecord::Base
	belongs_to :user 
	has_many :cards 
			validates :name, uniqueness: true
	attr_accessor :cards_arr

	def sample_from_deck 
		card = self.cards.sample(1)[0]
		return card
	end
	
end




