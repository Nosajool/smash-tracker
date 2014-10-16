class CharactersController < ApplicationController
	def index
		@characters = Character.all
	end

	def show
	  	@character = Character.find(params[:id])
	  	@victories = Character.victories(@character.id)
	  	@defeats = Character.defeats(@character.id)
	  	@matches = Character.matches(@character.id)
	end
end
