class User < ActiveRecord::Base
	has_many :matches
	VALID_NAME_REGEX = /\A[a-zA-Z0-9_.]+\Z/
	validates(:name, presence: true, format: { with: VALID_NAME_REGEX }, uniqueness: true)


	def self.most_played_character(user_id)
		# Match.unscoped.select("wcharacter_id").where(winner_id: user_id).group("wcharacter_id").order("count(*) desc")
		Match.find_by_sql("SELECT * FROM
											(SELECT wcharacter_id FROM matches WHERE winner_id = #{user_id}
											UNION ALL
											SELECT lcharacter_id FROM matches WHERE loser_id = #{user_id})
											GROUP BY wcharacter_id ORDER BY count(*) DESC") # GROUP BY wcharacter_id ORDER BY count(*) DESC")
	end
end
