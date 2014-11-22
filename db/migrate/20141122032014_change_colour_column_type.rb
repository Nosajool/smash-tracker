class ChangeColourColumnType < ActiveRecord::Migration
  def change
  	change_column :characters, :colour, :string
  end
end
