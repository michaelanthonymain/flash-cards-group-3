# #Let's make some flashcards

# #cards
# id (auto)
# deck_id
# question
# answer
# create_at
# updated_at



# #dekcs
# id
# name
# user_id
# created_at
# updated_at

#if we want to just try to run the cards what informatoin do we need? - we need a way to look at the information in a particular deck - we need a way to look at the information in a particular card (we can ignore rounds for now)



# Deck.create({name: "Books", user_id: 1})
# Deck.create({name: "Pokemon", user_id: 1})  DONE
# Card.create({deck_id: 1, question: "What is the yellow pokemon that ash treats like a human being?", answer: "Pikachu"}) DONE

# Card.create({deck_id: 1, question: "What is the fiery one fully evolved?", answer: "Charzard"})

# Card.create({deck_id: 1, question: "What is the cute water one that rhymes with myrtle?", answer: "Squirtle"})

# Card.create({deck_id: 1, question: "What is best pokemon?", answer: "Mewtwo"})

# Card.create({deck_id: 1, question: "What is of the hot water trainer from Cerulean?", answer: "Misty"})

#do not reseed the above information