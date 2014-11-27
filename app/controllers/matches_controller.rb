class MatchesController < ApplicationController
  def new
  	@match = Match.new
  	@users = User.all
    @characters = Character.all
  end

  def create
    @match = Match.new(match_params)
    @users = User.all
    @characters = Character.all

    if @match.save
      flash[:success] = "Match #{@match.id} created."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def index
    @matches = Match.includes(:lcharacter, :wcharacter, :winner, :loser).page(params[:page]).per(30)
    @numMatches = Match.all.count
  end

  def show
  	@match = Match.find(params[:id])
  end

  private

  def match_params
    params.permit(:winner_id, :loser_id, :winner_stock, :wcharacter_id, :lcharacter_id)
  end
end
