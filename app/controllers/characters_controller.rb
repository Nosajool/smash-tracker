class CharactersController < ApplicationController
	def index
		@characters = Character.all
		@characterStats = Character.stats
	end

	def show
	  	@character = Character.find(params[:id])
	  	@victories = Character.victories(@character.id)
	  	@defeats = Character.defeats(@character.id)
	end
end
