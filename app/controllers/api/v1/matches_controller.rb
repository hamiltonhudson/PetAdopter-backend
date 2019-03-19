class Api::V1::MatchesController < ApplicationController

  def index
    @matches = Match.all
    render json: @matches
  end

  def show
    @match = Match.find(params[:id])
    render json: @match, status: :ok
  end

  def create
    @match = Match.create(match_params)
    if @match.valid?
      render json: @match, status: :ok
    else
      render json: @match.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @user = User.find{|user| user.id == @match.user_id}
    @match.destroy
    # @matches = @user.matches.reject{|match| match.id == @match.id}
    @matches = @user.matches
    render json: @matches, status: :ok
  end

  private
    def match_params
      params.require(:match).permit(:user_id, :pet_id)
    end

end
