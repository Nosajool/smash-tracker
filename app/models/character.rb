class Character < ActiveRecord::Base
	has_many :matches

  validates_presence_of :imagename
  validates_presence_of :colour

	def self.victories(character_id)
		Match.includes(:lcharacter, :wcharacter, :loser, :winner).where(wcharacter_id: character_id)
	end

	def self.defeats(character_id)
		Match.includes(:lcharacter, :wcharacter, :loser, :winner).where(lcharacter_id: character_id)
	end

	def self.matches(character_id)
		Match.includes(:lcharacter, :wcharacter, :loser, :winner).where("wcharacter_id = #{character_id} OR lcharacter_id = #{character_id}")
	end

	def self.num_victories(character_id)
		Match.where(wcharacter_id: character_id).count
	end

	def self.num_defeats(character_id)
		Match.where(lcharacter_id: character_id).count
	end

	def self.stats
		losses = Match.reorder(:lcharacter_id).group(:lcharacter_id).count
		wins = Match.reorder(:wcharacter_id).group(:wcharacter_id).count
		Hash[((1..Character.count).to_a).map{|k| [k, [losses[k] || 0, wins[k] || 0]]} ]
	end
end
