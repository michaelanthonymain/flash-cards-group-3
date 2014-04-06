class Card < ActiveRecord::Base
	belongs_to :deck
	has_many :guesses

	def check_answer(user_input)
		if user_input.downcase.strip == self.answer.downcase
			return true
		else
			return false
		end
	end

end
