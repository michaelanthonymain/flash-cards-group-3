class User < ActiveRecord::Base
	has_many :decks
	has_many :rounds
      validates :name, uniqueness: true

    def self.authenticate(name, password)
      if self.find(name: name).password == password
        return true
      else
        return false
      end
    end

end
