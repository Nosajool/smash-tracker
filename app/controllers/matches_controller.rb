class MatchesController < ApplicationController
  def new
  	@match = Match.new
  	@users = User.all
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      flash[:success] = "Match #{@match.id} created."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def index
  	@matches = Match.all
  end

  def show
  	@match = Match.find(params[:id])
  end


  private

  def match_params
    params.permit(:winner_id, :loser_id, :winner_stock)
  end
end
