class CharactersController < ApplicationController
	def index
		@characters = Character.all
		@characterStats = Character.stats
	end

	def show
	  	@character = Character.find(params[:id])
	  	@victories = @character.wins.includes(:lcharacter, :wcharacter, :winner, :loser)
	  	@defeats = @character.losses.includes(:lcharacter, :wcharacter, :winner, :loser)
	end
end
