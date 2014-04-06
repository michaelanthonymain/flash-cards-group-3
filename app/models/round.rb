class Round < ActiveRecord::Base
	belongs_to :user
	belongs_to :deck
	has_many :guesses
	
	def get_number_correct
		num_correct = 0
		(self.guesses).each do |guess|
			num_correct += 1 if guess.is_correct == true
		end
		return num_correct
	end
end

