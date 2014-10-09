class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "#{@user.name} created."
  		redirect_to users_path
  	else
  		render 'new'
  	end
  end

  def index
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
    @victories = Match.where(winner_id: @user.id)
    @defeats = Match.where(loser_id: @user.id)
    @matches = []
    @matches.concat(@victories).concat(@defeats)
  end


  
  private

  def user_params
  	params.require(:user).permit(:name)
  end
end
