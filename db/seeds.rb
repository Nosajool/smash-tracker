require 'json'
character_data_file = 'app/data/characters.json'
file = File.read(character_data_file)
characters = JSON.parse(file)
puts "Inputting character data."
characters.each do |character_data|
  character = Character.find_or_create_by(name: character_data["name"])
  character.update!(
    imagename: character_data["imagename"],
    colour: character_data["colour"]
  )
  puts "#{character_data["name"]} updated."
end
