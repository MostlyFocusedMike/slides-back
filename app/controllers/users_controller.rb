class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def index 
    render json: User.all
  end 

  def show 
    render json: @user 
  end 

  def create 

  end 

  private 
    def user_params
      params.require(:user).permit(:username, :email, :bio, :pic_link, :password)
    end 

    def set_user 
      @user = User.find(params[:id])
    end 
end
