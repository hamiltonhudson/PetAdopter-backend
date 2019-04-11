class Api::V1::AuthController < ApplicationController

  def create
    @user = User.find_by(username: params["username"])
    if (@user && @user.authenticate(params["password"]))
      render json: {
        username: @user.username,
        id: @user.id,
        name: @user.name,
        matches: @user.matches,
        pets: @user.pets,
        token: get_token(payload(@user.username, @user.id))
        # }, status: :accepted
      }
    else
      render json: { errors: 'Invalid username or password' }, status: :unauthorized
    end
  end

end
