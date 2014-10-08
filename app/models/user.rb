class User < ActiveRecord::Base
	has_many :matches
	VALID_NAME_REGEX = /\A[a-zA-Z0-9]+\Z/
	validates(:name, presence: true, format: { with: VALID_NAME_REGEX }, uniqueness: true)
end
