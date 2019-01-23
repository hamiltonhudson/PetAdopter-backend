class Api::V1::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

#POST api/v1/users
  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: @user, status: :ok
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
  end
end

  def update
    @user = User.find(user_params[:id])
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end



  private
  def user_params
    params.require(:user).permit(:name, :email, :pet_id)
  end

end
