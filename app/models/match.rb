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
	validate :unique_winner_id_and_loser_id, on: :create

	def unique_winner_id_and_loser_id
		errors.add(:winner_and_loser, "are the same user") if winner_id == loser_id
	end
end
