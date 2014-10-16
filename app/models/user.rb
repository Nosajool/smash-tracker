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
end
