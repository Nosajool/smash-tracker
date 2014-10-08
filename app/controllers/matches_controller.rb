class MatchesController < ApplicationController
  def new
  end

  def index
  	@matches = Match.all
  end

  def show
  	@match = Match.find(params[:id])
  end
end
