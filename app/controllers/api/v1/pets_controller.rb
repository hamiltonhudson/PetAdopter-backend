class Api::V1::PetsController < ApplicationController
  before_action :requires_login, only: [:show, :index]

  def index
    @pets = Pet.all
    render json: @pets
  end

  def show
    @pet = Pet.find(params[:id])
    render json: @pet, status: :ok
  end

  def sample_fifty
    @fifty_pets = Pet.all.map { |pet| pet.photo }.sample(50)
    render json: @fifty_pets, status: :ok
  end

  def create
    @pet = Pet.create(pet_params)
    if @pet.valid?
      render json: @pet, status: :ok
    else
      render json: @pet.erros.full_messages, status: :unprocessable_entity
    end
  end

  def update
  @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      @pet.save
      @user = User.all.find{|user| user.id == @pet.owner_id}
      @user.save
      @pets = Pet.all
      render json: @pets, status: :ok
    else
      render json: @pet.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :age, :size, :sex, :breed, :animal, :description, :photo, :shelterId, :adopted, :owner_id)
    end

end
