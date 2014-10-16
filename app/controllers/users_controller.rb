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
    @victories = User.victories(@user.id)
    @defeats = User.defeats(@user.id)
    @matches = []
    @matches.concat(@victories).concat(@defeats)
  end

  def compare
    @users = User.all
    if params[:id1] && params[:id2]
      @user1 = User.find(params[:id1])
      @user2 = User.find(params[:id2])
      @u1matches = Match.where(winner_id: @user1.id, loser_id: @user2.id)
      @u2matches = Match.where(winner_id: @user2.id, loser_id: @user1.id)
      @matches = []
      @matches.concat(@u1matches).concat(@u2matches)
    else
    end
  end
  
  private

  def user_params
  	params.require(:user).permit(:name)
  end
end
