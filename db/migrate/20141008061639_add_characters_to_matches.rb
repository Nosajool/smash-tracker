class AddCharactersToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :wcharacter_id, :integer
    add_column :matches, :lcharacter_id, :integer
  end
end
