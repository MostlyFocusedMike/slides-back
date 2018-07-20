class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def index 
    render json: User.all
  end 

  def show 
    render json: @user 
  end 

  def create 
    @user = User.new(user_params)

    if @user.save
      # method from Application Controller to give signed up 
      # users a token
      render json: give_token_to(@user), adapter: nil
    else 
      render json: @user.errors.messages 
    end 
  end 

  private 
    def user_params
      params.require(:user).permit(:username, :email, :bio, :pic_link, :password, :password_confirmation)
    end 

    def set_user 
      @user = User.find(params[:id])
    end 
end
