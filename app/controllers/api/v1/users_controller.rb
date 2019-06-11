class Api::V1::UsersController < ApplicationController
  before_action :requires_login, only: [:index, :show]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  def profile
    render json: { user: User.new(current_user) }, status: :accepted
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = get_token(payload(@user.username, @user.id))
      render json: {
        username: @user.username,
        name: @user.name,
        pets: @user.pets,
        matches: @user.matches,
        pet_id: @user.pet_id,
        id: @user.id,
        token: get_token(payload(@user.username, @user.id))
        }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :username, :pet_id, :password)
    end

end
