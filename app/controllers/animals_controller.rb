class AnimalsController < ApplicationController

  def index
    animal = Animal.all
    render json: animal
  end

  def show
    animal = Animal.find(params[:id]).as_json(include: :sightings)
    render json: animal
  end


  def create
    animal = Animal.create(animal_params)
    if animal.valid?
      render json: animal
    else
      render json: animal.errors
  end
end

def destroy
    animal = Animal.find(params[:id])
    if animal.destroy
      render json: animal
    else
      render json: animal.errors
    end
  end

  private
  def animal_params
    params.require(:animal).permit(:common_name, :latin_name, :kingdom)
  end

end
