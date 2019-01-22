class Api::V1::MatchesController < ApplicationController
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
