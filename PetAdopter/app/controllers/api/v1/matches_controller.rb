class Api::V1::MatchesController < ApplicationController

  #GET to api/v1/matches
  def index
    @matches = Match.all
    render json: @matches
  end

  #GET to api/v1/matches/:id
  def show
    @match = Match.find(params[:id])
    render json: @match, status: :ok
  end

  #POST api/v1/matches
  def create
    @match = Match.create(match_params)
    if @match.valid?
      render json: @match, status: :ok
    else
      render json: @match.errors.full_messages, status: :unprocessable_entity
    end
  end

  def delete
    @match = Match.find(params[:id])
    @match.destroy
  end

    private
    def match_params
      params.require(:match).permit(:user_id, :pet_id)
    end


end
