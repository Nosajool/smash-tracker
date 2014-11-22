class AddColoursToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :colour, :integer
    add_column :characters, :imagename, :string
  end
end
