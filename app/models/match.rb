class Match < ActiveRecord::Base
	belongs_to :winner, class_name: "User"
	belongs_to :loser, class_name: "User"
	belongs_to :wcharacter, class_name: "Character"
	belongs_to :lcharacter, class_name: "Character"

	default_scope -> { order('created_at DESC') }

	validates(:winner_id, presence: true)
	validates(:loser_id, presence: true)
	validates(:wcharacter_id, presence: true, inclusion: { in: 1..51 } )
	validates(:lcharacter_id, presence: true, inclusion: { in: 1..51 } )
	validates(:winner_stock, presence: true, inclusion: { in: 1..4 } )


	def self.character_victories(character_id)
		Match.where(wcharacter_id: character_id)
	end

	def self.character_defeats(character_id)
		Match.where(lcharacter_id: character_id)
	end

	def self.user_victories(user_id)
		Match.where(winner_id: user_id)
	end

	def self.user_defeats(user_id)
		Match.where(loser_id: user_id)
	end 	

end
