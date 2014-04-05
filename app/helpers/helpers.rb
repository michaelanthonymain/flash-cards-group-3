
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


