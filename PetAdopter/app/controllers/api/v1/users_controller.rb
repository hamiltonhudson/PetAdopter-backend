class Api::V1::UsersController < ApplicationController

  def show
    @user = Pet.find(params[:id])
    render json: @user, status: :ok
  end

#POST api/v1/parties
  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: @user, status: :ok
    else
      render json: @user.erros.full_messages, status: :unprocessable_entity
  end
end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end


end

end
