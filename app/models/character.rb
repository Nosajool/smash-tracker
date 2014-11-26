class Character < ActiveRecord::Base
	has_many :wins, class_name: 'Match', foreign_key: 'wcharacter_id'
	has_many :losses, class_name: 'Match', foreign_key: 'lcharacter_id'

	# deprecated by Character#wins.includes(:lcharacter, :wcharacter, :winner, :loser)
	# def self.victories(character_id)
	# 	Match.includes(:lcharacter, :wcharacter, :loser, :winner).where(wcharacter_id: character_id)
	# end

	# deprecated by Character#losses.includes(:lcharacter, :wcharacter, :winner, :loser)
	# def self.defeats(character_id)
	# 	Match.includes(:lcharacter, :wcharacter, :loser, :winner).where(lcharacter_id: character_id)
	# end

	def matches
		Match.includes(:lcharacter, :wcharacter, :loser, :winner).where("wcharacter_id = #{self.id} OR lcharacter_id = #{self.id}")
	end

	# deprecated by Character#wins.count instead
	# def num_victories
	# 	Match.where(wcharacter_id: self.id).count
	# end

	# deprecated by Character#losses.count
	# def num_defeats
	# 	Match.where(lcharacter_id: self.id).count
	# end

	def self.stats
		losses = Match.reorder(:lcharacter_id).group(:lcharacter_id).count
		wins = Match.reorder(:wcharacter_id).group(:wcharacter_id).count
		Hash[((1..Character.count).to_a).map{|k| [k, [losses[k] || 0, wins[k] || 0]]} ]
	end
end
