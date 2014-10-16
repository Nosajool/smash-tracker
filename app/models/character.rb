class Character < ActiveRecord::Base
	has_many :matches

	def self.victories(character_id)
		Match.where(wcharacter_id: character_id)
	end

	def self.defeats(character_id)
		Match.where(lcharacter_id: character_id)
	end
end
