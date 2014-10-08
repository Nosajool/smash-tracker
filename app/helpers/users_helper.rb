module UsersHelper
	def users_hash(users)
		hash = Hash.new
		users.each do |user|
			hash["#{user.name}"] = user.id
		end
		hash
	end
end