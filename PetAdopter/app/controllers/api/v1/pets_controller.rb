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
    @pet = Party.create(pet_params)
    if @pet.valid?
      render json: @pet, status: :ok
    else
      render json: @pet.erros.full_messages, status: :unprocessable_entity
  end
end

def update
  @pet = Pet.find(params[:id])
  if @pet.update(pet_params)
    render json: @pet, status: :ok
  else
    render json: @pet.errors.full_messages, status: :unprocessable_entity
  end
end

  private
  def pet_params
    params.require(:pet).permit(:name, :age, :size, :sex, :breed, :animal, :description, :photo, :shelterId, :adopted, :owner_id)
  end


end
