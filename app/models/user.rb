class User < ActiveRecord::Base
	has_many :wins, class_name: 'Match', foreign_key: 'winner_id'
	has_many :losses, class_name: 'Match', foreign_key: 'loser_id'

	VALID_NAME_REGEX = /\A[a-zA-Z0-9_.]+\Z/
	validates(:name, presence: true, format: { with: VALID_NAME_REGEX }, uniqueness: true)

	# deprecated by @user.wins.includes(:lcharacter, :wcharacter, :winner, :loser)
	# def self.victories(user_id)
	# 	Match.includes(:lcharacter, :wcharacter, :winner, :loser).where(winner_id: user_id)
	# end

	# deprecated by @user.losses.includes(:lcharacter, :wcharacter, :winner, :loser)
	# def self.defeats(user_id)
	# 	Match.includes(:lcharacter, :wcharacter, :winner, :loser).where(loser_id: user_id)
	# end	

	def self.all_matches(user_id)
		Match.includes(:lcharacter, :wcharacter, :winner, :loser).where("winner_id = #{user_id} OR loser_id = #{user_id}")
	end

	def self.wins_against(winner_id, loser_id)
		Match.includes(:lcharacter, :wcharacter, :winner, :loser).where(winner_id: winner_id, loser_id: loser_id)
	end

	def self.matches_between(user1_id, user2_id)
		Match.includes(:lcharacter, :wcharacter, :winner, :loser).where("(winner_id = #{user1_id} AND loser_id = #{user2_id}) OR (winner_id = #{user2_id} AND loser_id = #{user1_id})")
	end

	def self.num_victories(user_id)
		Match.where(winner_id: user_id).count
	end

	def self.num_defeats(user_id)
		Match.where(loser_id: user_id).count
	end

	def top_x_most_played_character(x)
		# Match.unscoped.select("wcharacter_id").where(winner_id: user_id).group("wcharacter_id").order("count(*) desc")
		User.find_by_sql("SELECT 
			(SELECT name FROM characters WHERE id = wcharacter_id) AS char, 
			count(wcharacter_id) AS games FROM
											(SELECT wcharacter_id FROM matches WHERE winner_id = #{self.id}
											UNION ALL
											SELECT lcharacter_id FROM matches WHERE loser_id = #{self.id}) AS plays
											GROUP BY wcharacter_id ORDER BY count(*) DESC LIMIT #{x}") # GROUP BY wcharacter_id ORDER BY count(*) DESC")
	end

	def self.stats
		losses = Match.reorder(:loser_id).group(:loser_id).count
		wins = Match.reorder(:winner_id).group(:winner_id).count
		Hash[((1..User.count).to_a).map{|k| [k, [losses[k] || 0, wins[k] || 0]]} ]
	end

end
