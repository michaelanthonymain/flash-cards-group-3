class User < ActiveRecord::Base
	has_many :decks
	has_many :rounds
      validates :name, uniqueness: true

    def self.authenticate(name, password)
      User.where(name: name, password: password).first
    end

end
