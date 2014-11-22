require 'json'
character_data_file = 'app/data/characters.json'
file = File.read(character_data_file)
characters = JSON.parse(file)
puts "Inputting character data"
characters.each do |character|
	Character.create!({ name: character["name"], 
						id: character["id"],
						imagename: character["imagename"],
						colour: character["colour"] })
	puts "#{character["name"]} added"
end