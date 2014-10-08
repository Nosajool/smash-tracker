module CharactersHelper
	def character_hash(characters)
		hash = Hash.new
		characters.each do |character|
			hash["#{character.name}"] = character.id
		end
		hash
	end
end