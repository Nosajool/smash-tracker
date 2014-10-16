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
end
