class CharactersController < ApplicationController
	def index
		@characters = Character.all
	end

	def show
	  	@character = Character.find(params[:id])
	  	@victories = Match.where(wcharacter: @character.id)
	  	@defeats = Match.where(lcharacter: @character.id)
  	    @matches = @victories.concat(@defeats);
	end
end
