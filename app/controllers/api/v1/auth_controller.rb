class Api::V1::AuthController < ApplicationController
  # skip_before_action :authorized, only: [:create, :show]

  def create
    byebug
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      render json: give_token_to(user)
    else
      render({json: {error: 'User is invalid'}, status: 401})
    end
  end

  def show
    if current_user
      render json: {
        id: current_user.id,
        username: current_user.username
      }
    else
      render json: {error: 'Invalid token'}, status: 401
    end
  end


end
