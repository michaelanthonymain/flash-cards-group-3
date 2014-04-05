class Card < ActiveRecord::Base
	belongs_to :deck
	has_many :guesses

	def is_answer_correct?(guess_object)
		if guess_object.user_input.downcase == self.answer
			guess_object.is_correct = true
		else
			guess_object.is_correct = false
		end 
	end
end
