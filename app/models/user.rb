class User < ActiveRecord::Base
	has_many :matches
	VALID_NAME_REGEX = /\A[a-zA-Z0-9_.]+\Z/
	validates(:name, presence: true, format: { with: VALID_NAME_REGEX }, uniqueness: true)

	def self.victories(user_id)
		Match.where(winner_id: user_id)
	end

	def self.defeats(user_id)
		Match.where(loser_id: user_id)
	end	

	def self.matches(user_id)
		Match.where("winner_id = #{user_id} OR loser_id = #{user_id}")
	end

	def self.wins_against(winner_id, loser_id)
		Match.where(winner_id: winner_id, loser_id: loser_id)
	end

	def self.matches_between(user1_id, user2_id)
		Match.where("(winner_id = #{user1_id} AND loser_id = #{user2_id}) OR (winner_id = #{user2_id} AND loser_id = #{user1_id})")
	end

	def self.num_victories(user_id)
		Match.where(winner_id: user_id).count
	end

	def self.num_defeats(user_id)
		Match.where(loser_id: user_id).count


	def self.most_played_character(user_id)
		# Match.unscoped.select("wcharacter_id").where(winner_id: user_id).group("wcharacter_id").order("count(*) desc")
		Match.find_by_sql("SELECT * FROM
											(SELECT wcharacter_id FROM matches WHERE winner_id = #{user_id}
											UNION ALL
											SELECT lcharacter_id FROM matches WHERE loser_id = #{user_id})
											GROUP BY wcharacter_id ORDER BY count(*) DESC") # GROUP BY wcharacter_id ORDER BY count(*) DESC")

	end
end
