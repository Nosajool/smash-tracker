class AddIndexesToIds < ActiveRecord::Migration
  def change
  	add_index :matches, :winner_id
  	add_index :matches, :loser_id
  	add_index :matches, :wcharacter_id
  	add_index :matches, :lcharacter_id
  end
end
