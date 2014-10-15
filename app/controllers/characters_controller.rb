class CharactersController < ApplicationController
	def index
		@characters = Character.all
	end

	def show
	  	@character = Character.find(params[:id])
	  	@victories = Match.character_victories(@character.id)
	  	@defeats = Match.character_defeats(@character.id)
	  	@matches = []
  	  @matches.concat(@victories).concat(@defeats)
	end
end
