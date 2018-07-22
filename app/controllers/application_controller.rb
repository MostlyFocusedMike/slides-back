class ApplicationController < ActionController::API
    # before_action :authorized
 # this will run before every single action gets called, make sure you skip_before_action in the appropriate places

  def new_token(payload)
    JWT.encode(payload, ENV['token_secret'], 'HS256')
  end

  def hash_of(user)
    # hash version of user, sent back to front end for authentication
    {id: user[:id],
     username: user[:username] 
    }
  end 

  def user_token_hash(user)
    {user: hash_of(user),
     token: new_token({id: user.id})
    }
  end 

 
  def current_user
    @user ||= User.find_by(id: user_id)
  end
 
  def user_id
    decoded_token.first['id']
  end
 
  def decoded_token
    begin
       JWT.decode(request.headers['Authorization'], ENV['token_secret'], true, {:algorithm => 'HS256'})
    rescue JWT::DecodeError
      [{}]
    end
  end
 
  def authorized
    render json: {message: "Not welcome" }, status: 401 unless logged_in?
  end
 
  def logged_in?
    !!current_user
  end
end
