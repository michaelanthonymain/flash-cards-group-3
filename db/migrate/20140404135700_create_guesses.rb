class CreateGuesses < ActiveRecord::Migration
  def change
  	create_table :guesses do |t|
  		t.integer :round_id
  		t.integer :card_id
  		t.string :user_input
  		t.boolean :is_correct
  		t.timestamps
  	end

  end
end
