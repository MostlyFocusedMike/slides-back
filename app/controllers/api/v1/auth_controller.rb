class Api::V1::AuthController < ApplicationController
  # skip_before_action :authorized, only: [:create, :show]

  def create
    # when a user logs in they go here
    byebug
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      render json: user_token_hash(user) 
    else
      render({json: {error: 'User is invalid'}, status: 401})
    end
  end

  def show
    byebug
    if current_user
      render json: hash_of(current_user), status: 200
    else
      render json: {error: 'Invalid token'}, status: 401
    end
  end


end
