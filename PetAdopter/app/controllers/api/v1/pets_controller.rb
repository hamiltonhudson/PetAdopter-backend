class Api::V1::PetsController < ApplicationController

#GET to api/v1/pets
  def index
    @pets = Pet.all
    render json: @pets
  end

#GET to api/v1/pets/:id
  def show
    @pet = Pet.find(params[:id])
    render json: @pet, status: :ok
  end

#POST api/v1/parties
  def create
    @party = Party.create(party_params)
    if @pet.valid?
      render json: @pet, status: :ok
    else
      render json: @pet.erros.full_messages, status: :unprocessable_entity
  end
end

  private
  def pet_params
    params.require(:pet).permit(:name, :age, :size, :sex, :breed, :animal, :description, :photo, :shelterId)
  end


end
