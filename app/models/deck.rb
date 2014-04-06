class Deck < ActiveRecord::Base
	belongs_to :user 
	has_many :cards 
			validates :name, uniqueness: true
	attr_accessor :cards_arr

	def get_cards 
	 	@cards_arr = self.cards.shuffle
	end
  def pick_card
	 	this_card = self.cards_arr.delete_at(0)
	 	return this_card
	end
end


