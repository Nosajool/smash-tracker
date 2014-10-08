class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "#{@user.name} created."
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def index
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
  	params.require(:user).permit(:name)
  end
end
